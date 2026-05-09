; DESCRIPTION: Places a black line segment connecting (433, 106) to (72, 57).
; PLAN: r0=433(x1), r1=106(y1), r2=72(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 106
LDI r2, 72
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
