; DESCRIPTION: Places a black line segment connecting (498, 13) to (250, 57).
; PLAN: r0=498(x1), r1=13(y1), r2=250(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 13
LDI r2, 250
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
