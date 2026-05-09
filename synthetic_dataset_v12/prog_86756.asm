; DESCRIPTION: Places a white line segment connecting (78, 144) to (95, 39).
; PLAN: r0=78(x1), r1=144(y1), r2=95(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 144
LDI r2, 95
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
