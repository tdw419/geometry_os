; DESCRIPTION: Draws a blue line from (107, 230) to (260, 108).
; PLAN: r0=107(x1), r1=230(y1), r2=260(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 230
LDI r2, 260
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
