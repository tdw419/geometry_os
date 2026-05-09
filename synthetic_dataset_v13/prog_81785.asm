; DESCRIPTION: Renders a yellow box of size 80x97 starting at (226, 35).
; PLAN: r0=226(x), r1=35(y), r2=80(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 35
LDI r2, 80
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
