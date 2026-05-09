; DESCRIPTION: Renders a black line between points (467, 74) and (200, 240).
; PLAN: r0=467(x1), r1=74(y1), r2=200(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 74
LDI r2, 200
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
