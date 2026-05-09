; DESCRIPTION: Draws a purple line from (237, 215) to (117, 63).
; PLAN: r0=237(x1), r1=215(y1), r2=117(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 215
LDI r2, 117
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
