; DESCRIPTION: Renders a white line between points (288, 196) and (66, 35).
; PLAN: r0=288(x1), r1=196(y1), r2=66(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 196
LDI r2, 66
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
