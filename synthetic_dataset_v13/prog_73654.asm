; DESCRIPTION: Places a blue line segment connecting (321, 220) to (166, 167).
; PLAN: r0=321(x1), r1=220(y1), r2=166(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 220
LDI r2, 166
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
