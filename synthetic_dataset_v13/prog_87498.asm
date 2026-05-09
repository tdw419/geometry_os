; DESCRIPTION: Renders a yellow box of size 46x113 starting at (199, 96).
; PLAN: r0=199(x), r1=96(y), r2=46(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 96
LDI r2, 46
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
