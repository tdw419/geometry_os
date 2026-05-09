; DESCRIPTION: Renders a white line between points (492, 75) and (288, 145).
; PLAN: r0=492(x1), r1=75(y1), r2=288(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 75
LDI r2, 288
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
