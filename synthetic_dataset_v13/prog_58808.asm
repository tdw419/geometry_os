; DESCRIPTION: Places a black line segment connecting (352, 32) to (75, 149).
; PLAN: r0=352(x1), r1=32(y1), r2=75(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 32
LDI r2, 75
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
