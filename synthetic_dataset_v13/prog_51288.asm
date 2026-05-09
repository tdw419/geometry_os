; DESCRIPTION: Draws a blue line from (431, 97) to (167, 207).
; PLAN: r0=431(x1), r1=97(y1), r2=167(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 97
LDI r2, 167
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
