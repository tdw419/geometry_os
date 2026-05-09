; DESCRIPTION: Draws a yellow line from (392, 176) to (155, 127).
; PLAN: r0=392(x1), r1=176(y1), r2=155(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 176
LDI r2, 155
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
