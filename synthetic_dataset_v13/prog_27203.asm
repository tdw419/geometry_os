; DESCRIPTION: Places a black line segment connecting (43, 51) to (464, 250).
; PLAN: r0=43(x1), r1=51(y1), r2=464(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 51
LDI r2, 464
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
