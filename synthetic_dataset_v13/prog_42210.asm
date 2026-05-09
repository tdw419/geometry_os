; DESCRIPTION: Draws a blue line from (126, 84) to (222, 166).
; PLAN: r0=126(x1), r1=84(y1), r2=222(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 84
LDI r2, 222
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
