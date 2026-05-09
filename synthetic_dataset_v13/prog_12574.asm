; DESCRIPTION: Places a blue line segment connecting (128, 199) to (120, 98).
; PLAN: r0=128(x1), r1=199(y1), r2=120(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 199
LDI r2, 120
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
