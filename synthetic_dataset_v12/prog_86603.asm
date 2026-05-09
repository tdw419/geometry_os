; DESCRIPTION: Draws a blue line from (302, 212) to (499, 231).
; PLAN: r0=302(x1), r1=212(y1), r2=499(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 212
LDI r2, 499
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
