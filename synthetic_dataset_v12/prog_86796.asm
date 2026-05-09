; DESCRIPTION: Renders a yellow line between points (432, 125) and (329, 31).
; PLAN: r0=432(x1), r1=125(y1), r2=329(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 125
LDI r2, 329
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
