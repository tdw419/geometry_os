; DESCRIPTION: Renders a yellow box of size 34x72 starting at (199, 69).
; PLAN: r0=199(x), r1=69(y), r2=34(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 69
LDI r2, 34
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
