; DESCRIPTION: Places a blue line segment connecting (304, 85) to (397, 166).
; PLAN: r0=304(x1), r1=85(y1), r2=397(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 85
LDI r2, 397
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
