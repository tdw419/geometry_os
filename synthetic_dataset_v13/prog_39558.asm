; DESCRIPTION: Renders a white line between points (0, 35) and (375, 140).
; PLAN: r0=0(x1), r1=35(y1), r2=375(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 35
LDI r2, 375
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
