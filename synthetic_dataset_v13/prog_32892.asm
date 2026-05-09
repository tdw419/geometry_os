; DESCRIPTION: Draws a purple line from (309, 213) to (260, 229).
; PLAN: r0=309(x1), r1=213(y1), r2=260(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 213
LDI r2, 260
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
