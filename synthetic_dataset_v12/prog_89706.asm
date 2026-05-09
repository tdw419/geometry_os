; DESCRIPTION: Renders a white line between points (454, 165) and (303, 251).
; PLAN: r0=454(x1), r1=165(y1), r2=303(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 165
LDI r2, 303
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
