; DESCRIPTION: Places a black line segment connecting (440, 14) to (304, 30).
; PLAN: r0=440(x1), r1=14(y1), r2=304(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 14
LDI r2, 304
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
