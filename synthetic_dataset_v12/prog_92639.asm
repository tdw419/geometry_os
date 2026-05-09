; DESCRIPTION: Places a blue line segment connecting (382, 96) to (130, 150).
; PLAN: r0=382(x1), r1=96(y1), r2=130(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 96
LDI r2, 130
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
