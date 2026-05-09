; DESCRIPTION: Draws a blue line from (337, 178) to (178, 26).
; PLAN: r0=337(x1), r1=178(y1), r2=178(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 178
LDI r2, 178
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
