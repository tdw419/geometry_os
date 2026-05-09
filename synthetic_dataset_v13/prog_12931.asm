; DESCRIPTION: Places a black line segment connecting (458, 144) to (75, 32).
; PLAN: r0=458(x1), r1=144(y1), r2=75(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 144
LDI r2, 75
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
