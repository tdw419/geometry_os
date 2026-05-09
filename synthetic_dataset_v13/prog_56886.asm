; DESCRIPTION: Draws a purple line from (72, 195) to (439, 215).
; PLAN: r0=72(x1), r1=195(y1), r2=439(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 195
LDI r2, 439
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
