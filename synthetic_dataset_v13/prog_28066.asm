; DESCRIPTION: Draws a purple line from (72, 204) to (392, 126).
; PLAN: r0=72(x1), r1=204(y1), r2=392(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 204
LDI r2, 392
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
