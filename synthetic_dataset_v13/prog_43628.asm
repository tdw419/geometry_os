; DESCRIPTION: Renders a yellow box of size 118x76 starting at (77, 22).
; PLAN: r0=77(x), r1=22(y), r2=118(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 22
LDI r2, 118
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
