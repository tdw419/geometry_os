; DESCRIPTION: Places a blue line segment connecting (464, 55) to (257, 170).
; PLAN: r0=464(x1), r1=55(y1), r2=257(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 55
LDI r2, 257
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
