; DESCRIPTION: Renders a yellow line between points (96, 97) and (291, 241).
; PLAN: r0=96(x1), r1=97(y1), r2=291(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 97
LDI r2, 291
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
