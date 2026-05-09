; DESCRIPTION: Draws a magenta line from (351, 9) to (108, 219).
; PLAN: r0=351(x1), r1=9(y1), r2=108(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 9
LDI r2, 108
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
