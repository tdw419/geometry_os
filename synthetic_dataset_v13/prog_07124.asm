; DESCRIPTION: Places a white line segment connecting (249, 82) to (375, 93).
; PLAN: r0=249(x1), r1=82(y1), r2=375(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 82
LDI r2, 375
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
