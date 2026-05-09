; DESCRIPTION: Places a blue line segment connecting (43, 44) to (35, 37).
; PLAN: r0=43(x1), r1=44(y1), r2=35(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 44
LDI r2, 35
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
