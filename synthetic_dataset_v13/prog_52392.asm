; DESCRIPTION: Places a blue line segment connecting (20, 53) to (434, 68).
; PLAN: r0=20(x1), r1=53(y1), r2=434(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 53
LDI r2, 434
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
