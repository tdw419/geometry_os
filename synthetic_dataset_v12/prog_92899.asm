; DESCRIPTION: Places a white line segment connecting (449, 127) to (139, 6).
; PLAN: r0=449(x1), r1=127(y1), r2=139(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 127
LDI r2, 139
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
