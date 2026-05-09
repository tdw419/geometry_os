; DESCRIPTION: Places a orange line segment connecting (467, 238) to (504, 93).
; PLAN: r0=467(x1), r1=238(y1), r2=504(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 238
LDI r2, 504
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
