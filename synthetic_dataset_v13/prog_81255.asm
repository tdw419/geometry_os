; DESCRIPTION: Places a blue line segment connecting (393, 87) to (156, 166).
; PLAN: r0=393(x1), r1=87(y1), r2=156(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 87
LDI r2, 156
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
