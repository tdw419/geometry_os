; DESCRIPTION: Places a black line segment connecting (44, 19) to (370, 150).
; PLAN: r0=44(x1), r1=19(y1), r2=370(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 19
LDI r2, 370
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
