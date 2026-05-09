; DESCRIPTION: Renders a yellow box of size 73x94 starting at (35, 77).
; PLAN: r0=35(x), r1=77(y), r2=73(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 77
LDI r2, 73
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
