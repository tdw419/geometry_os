; DESCRIPTION: Places a blue line segment connecting (195, 85) to (225, 187).
; PLAN: r0=195(x1), r1=85(y1), r2=225(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 85
LDI r2, 225
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
