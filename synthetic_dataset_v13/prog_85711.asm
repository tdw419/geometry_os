; DESCRIPTION: Places a blue line segment connecting (4, 244) to (258, 42).
; PLAN: r0=4(x1), r1=244(y1), r2=258(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 244
LDI r2, 258
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
