; DESCRIPTION: Draws a blue line from (350, 97) to (481, 65).
; PLAN: r0=350(x1), r1=97(y1), r2=481(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 97
LDI r2, 481
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
