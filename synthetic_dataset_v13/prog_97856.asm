; DESCRIPTION: Places a white line segment connecting (172, 186) to (419, 19).
; PLAN: r0=172(x1), r1=186(y1), r2=419(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 186
LDI r2, 419
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
