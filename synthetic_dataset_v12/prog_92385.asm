; DESCRIPTION: Places a white line segment connecting (219, 110) to (464, 234).
; PLAN: r0=219(x1), r1=110(y1), r2=464(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 110
LDI r2, 464
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
