; DESCRIPTION: Places a yellow line segment connecting (226, 88) to (444, 27).
; PLAN: r0=226(x1), r1=88(y1), r2=444(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 88
LDI r2, 444
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
