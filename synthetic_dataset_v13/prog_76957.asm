; DESCRIPTION: Renders a white line between points (85, 9) and (441, 243).
; PLAN: r0=85(x1), r1=9(y1), r2=441(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 9
LDI r2, 441
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
