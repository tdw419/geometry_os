; DESCRIPTION: Places a black line segment connecting (175, 60) to (370, 89).
; PLAN: r0=175(x1), r1=60(y1), r2=370(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 60
LDI r2, 370
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
