; DESCRIPTION: Places a black line segment connecting (278, 87) to (54, 134).
; PLAN: r0=278(x1), r1=87(y1), r2=54(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 87
LDI r2, 54
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
