; DESCRIPTION: Draws a purple line from (273, 197) to (188, 126).
; PLAN: r0=273(x1), r1=197(y1), r2=188(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 197
LDI r2, 188
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
