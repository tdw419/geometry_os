; DESCRIPTION: Places a white line segment connecting (419, 230) to (359, 93).
; PLAN: r0=419(x1), r1=230(y1), r2=359(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 230
LDI r2, 359
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
