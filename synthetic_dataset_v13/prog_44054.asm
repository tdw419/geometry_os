; DESCRIPTION: Places a white line segment connecting (37, 240) to (340, 247).
; PLAN: r0=37(x1), r1=240(y1), r2=340(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 240
LDI r2, 340
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
