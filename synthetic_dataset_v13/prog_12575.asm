; DESCRIPTION: Places a white line segment connecting (42, 247) to (355, 211).
; PLAN: r0=42(x1), r1=247(y1), r2=355(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 247
LDI r2, 355
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
