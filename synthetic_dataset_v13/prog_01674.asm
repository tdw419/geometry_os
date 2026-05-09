; DESCRIPTION: Places a white line segment connecting (340, 75) to (233, 24).
; PLAN: r0=340(x1), r1=75(y1), r2=233(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 75
LDI r2, 233
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
