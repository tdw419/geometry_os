; DESCRIPTION: Draws a purple line from (84, 4) to (440, 174).
; PLAN: r0=84(x1), r1=4(y1), r2=440(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 4
LDI r2, 440
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
