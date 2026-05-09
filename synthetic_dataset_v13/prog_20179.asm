; DESCRIPTION: Places a yellow line segment connecting (491, 120) to (464, 18).
; PLAN: r0=491(x1), r1=120(y1), r2=464(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 120
LDI r2, 464
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
