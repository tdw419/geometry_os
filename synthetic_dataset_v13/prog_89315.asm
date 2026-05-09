; DESCRIPTION: Places a blue line segment connecting (264, 27) to (55, 183).
; PLAN: r0=264(x1), r1=27(y1), r2=55(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 27
LDI r2, 55
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
