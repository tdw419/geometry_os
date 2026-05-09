; DESCRIPTION: Places a black line segment connecting (139, 180) to (228, 13).
; PLAN: r0=139(x1), r1=180(y1), r2=228(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 180
LDI r2, 228
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
