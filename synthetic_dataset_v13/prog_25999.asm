; DESCRIPTION: Places a black line segment connecting (187, 50) to (86, 75).
; PLAN: r0=187(x1), r1=50(y1), r2=86(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 50
LDI r2, 86
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
