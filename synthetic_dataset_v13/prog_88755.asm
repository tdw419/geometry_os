; DESCRIPTION: Renders a yellow line between points (459, 15) and (125, 233).
; PLAN: r0=459(x1), r1=15(y1), r2=125(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 15
LDI r2, 125
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
