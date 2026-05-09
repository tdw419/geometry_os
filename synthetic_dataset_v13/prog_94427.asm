; DESCRIPTION: Places a white line segment connecting (146, 148) to (249, 145).
; PLAN: r0=146(x1), r1=148(y1), r2=249(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 148
LDI r2, 249
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
