; DESCRIPTION: Draws a purple line from (108, 185) to (320, 2).
; PLAN: r0=108(x1), r1=185(y1), r2=320(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 185
LDI r2, 320
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
