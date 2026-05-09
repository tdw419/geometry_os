; DESCRIPTION: Renders a yellow line between points (150, 211) and (366, 25).
; PLAN: r0=150(x1), r1=211(y1), r2=366(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 211
LDI r2, 366
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
