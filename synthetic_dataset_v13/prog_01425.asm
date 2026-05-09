; DESCRIPTION: Places a black line segment connecting (193, 93) to (444, 139).
; PLAN: r0=193(x1), r1=93(y1), r2=444(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 93
LDI r2, 444
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
