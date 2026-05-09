; DESCRIPTION: Places a black line segment connecting (433, 57) to (90, 45).
; PLAN: r0=433(x1), r1=57(y1), r2=90(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 57
LDI r2, 90
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
