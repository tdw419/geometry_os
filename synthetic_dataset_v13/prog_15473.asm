; DESCRIPTION: Draws a purple line from (393, 213) to (205, 186).
; PLAN: r0=393(x1), r1=213(y1), r2=205(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 213
LDI r2, 205
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
