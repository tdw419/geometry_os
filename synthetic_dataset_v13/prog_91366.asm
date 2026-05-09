; DESCRIPTION: Draws a purple line from (471, 126) to (392, 166).
; PLAN: r0=471(x1), r1=126(y1), r2=392(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 126
LDI r2, 392
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
