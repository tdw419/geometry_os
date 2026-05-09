; DESCRIPTION: Places a blue line segment connecting (95, 42) to (431, 165).
; PLAN: r0=95(x1), r1=42(y1), r2=431(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 42
LDI r2, 431
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
