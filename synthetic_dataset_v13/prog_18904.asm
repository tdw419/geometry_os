; DESCRIPTION: Places a blue line segment connecting (30, 253) to (54, 14).
; PLAN: r0=30(x1), r1=253(y1), r2=54(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 253
LDI r2, 54
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
