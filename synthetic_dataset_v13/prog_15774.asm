; DESCRIPTION: Places a black line segment connecting (211, 12) to (464, 212).
; PLAN: r0=211(x1), r1=12(y1), r2=464(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 12
LDI r2, 464
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
