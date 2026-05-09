; DESCRIPTION: Places a blue line segment connecting (509, 233) to (300, 10).
; PLAN: r0=509(x1), r1=233(y1), r2=300(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 233
LDI r2, 300
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
