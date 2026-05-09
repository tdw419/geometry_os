; DESCRIPTION: Draws a purple line from (125, 229) to (344, 223).
; PLAN: r0=125(x1), r1=229(y1), r2=344(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 229
LDI r2, 344
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
