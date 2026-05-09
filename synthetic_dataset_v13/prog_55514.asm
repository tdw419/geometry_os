; DESCRIPTION: Places a white line segment connecting (467, 36) to (278, 6).
; PLAN: r0=467(x1), r1=36(y1), r2=278(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 36
LDI r2, 278
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
