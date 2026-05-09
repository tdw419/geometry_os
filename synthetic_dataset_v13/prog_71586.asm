; DESCRIPTION: Places a blue line segment connecting (42, 105) to (107, 212).
; PLAN: r0=42(x1), r1=105(y1), r2=107(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 105
LDI r2, 107
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
