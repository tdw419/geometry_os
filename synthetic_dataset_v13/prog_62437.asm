; DESCRIPTION: Renders a purple line between points (314, 125) and (344, 229).
; PLAN: r0=314(x1), r1=125(y1), r2=344(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 125
LDI r2, 344
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
