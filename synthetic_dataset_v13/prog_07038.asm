; DESCRIPTION: Places a blue line segment connecting (321, 82) to (127, 69).
; PLAN: r0=321(x1), r1=82(y1), r2=127(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 82
LDI r2, 127
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
