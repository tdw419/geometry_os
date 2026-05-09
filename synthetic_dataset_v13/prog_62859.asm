; DESCRIPTION: Places a blue line segment connecting (467, 50) to (293, 18).
; PLAN: r0=467(x1), r1=50(y1), r2=293(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 50
LDI r2, 293
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
