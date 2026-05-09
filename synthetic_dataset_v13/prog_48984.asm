; DESCRIPTION: Renders a white line between points (433, 165) and (321, 70).
; PLAN: r0=433(x1), r1=165(y1), r2=321(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 165
LDI r2, 321
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
