; DESCRIPTION: Renders a white line between points (495, 70) and (225, 86).
; PLAN: r0=495(x1), r1=70(y1), r2=225(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 70
LDI r2, 225
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
