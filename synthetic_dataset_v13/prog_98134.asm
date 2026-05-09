; DESCRIPTION: Renders a white line between points (251, 35) and (204, 60).
; PLAN: r0=251(x1), r1=35(y1), r2=204(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 35
LDI r2, 204
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
