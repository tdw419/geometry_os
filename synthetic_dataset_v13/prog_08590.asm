; DESCRIPTION: Draws a purple line from (392, 249) to (311, 239).
; PLAN: r0=392(x1), r1=249(y1), r2=311(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 249
LDI r2, 311
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
