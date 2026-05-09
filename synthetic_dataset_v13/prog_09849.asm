; DESCRIPTION: Places a blue line segment connecting (372, 38) to (95, 86).
; PLAN: r0=372(x1), r1=38(y1), r2=95(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 38
LDI r2, 95
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
