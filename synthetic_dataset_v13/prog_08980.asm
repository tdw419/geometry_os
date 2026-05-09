; DESCRIPTION: Places a black line segment connecting (90, 205) to (462, 91).
; PLAN: r0=90(x1), r1=205(y1), r2=462(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 205
LDI r2, 462
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
