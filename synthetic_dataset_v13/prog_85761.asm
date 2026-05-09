; DESCRIPTION: Draws a green line from (84, 237) to (55, 43).
; PLAN: r0=84(x1), r1=237(y1), r2=55(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 237
LDI r2, 55
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
