; DESCRIPTION: Renders a white line between points (459, 15) and (225, 78).
; PLAN: r0=459(x1), r1=15(y1), r2=225(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 15
LDI r2, 225
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
