; DESCRIPTION: Renders a yellow line between points (75, 40) and (36, 13).
; PLAN: r0=75(x1), r1=40(y1), r2=36(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 40
LDI r2, 36
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
