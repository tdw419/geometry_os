; DESCRIPTION: Places a white line segment connecting (75, 180) to (45, 131).
; PLAN: r0=75(x1), r1=180(y1), r2=45(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 180
LDI r2, 45
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
