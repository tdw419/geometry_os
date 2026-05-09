; DESCRIPTION: Places a black line segment connecting (9, 180) to (32, 247).
; PLAN: r0=9(x1), r1=180(y1), r2=32(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 180
LDI r2, 32
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
