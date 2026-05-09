; DESCRIPTION: Draws a blue line from (174, 65) to (107, 206).
; PLAN: r0=174(x1), r1=65(y1), r2=107(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 65
LDI r2, 107
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
