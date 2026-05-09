; DESCRIPTION: Places a black line segment connecting (196, 20) to (372, 10).
; PLAN: r0=196(x1), r1=20(y1), r2=372(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 20
LDI r2, 372
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
