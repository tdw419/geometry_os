; DESCRIPTION: Places a white line segment connecting (449, 18) to (193, 94).
; PLAN: r0=449(x1), r1=18(y1), r2=193(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 18
LDI r2, 193
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
