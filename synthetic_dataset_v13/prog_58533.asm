; DESCRIPTION: Draws a purple line from (213, 215) to (57, 252).
; PLAN: r0=213(x1), r1=215(y1), r2=57(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 215
LDI r2, 57
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
