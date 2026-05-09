; DESCRIPTION: Renders a yellow box of size 89x116 starting at (409, 108).
; PLAN: r0=409(x), r1=108(y), r2=89(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 108
LDI r2, 89
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
