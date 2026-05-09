; DESCRIPTION: Places a black line segment connecting (47, 85) to (353, 143).
; PLAN: r0=47(x1), r1=85(y1), r2=353(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 85
LDI r2, 353
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
