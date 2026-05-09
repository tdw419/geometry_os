; DESCRIPTION: Draws a purple line from (12, 85) to (113, 229).
; PLAN: r0=12(x1), r1=85(y1), r2=113(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 85
LDI r2, 113
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
