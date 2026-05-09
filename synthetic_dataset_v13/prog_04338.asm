; DESCRIPTION: Places a black line segment connecting (104, 71) to (193, 101).
; PLAN: r0=104(x1), r1=71(y1), r2=193(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 71
LDI r2, 193
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
