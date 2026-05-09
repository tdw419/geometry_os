; DESCRIPTION: Places a black line segment connecting (103, 120) to (419, 20).
; PLAN: r0=103(x1), r1=120(y1), r2=419(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 120
LDI r2, 419
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
