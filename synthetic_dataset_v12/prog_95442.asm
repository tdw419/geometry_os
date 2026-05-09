; DESCRIPTION: Renders a white line between points (428, 40) and (461, 63).
; PLAN: r0=428(x1), r1=40(y1), r2=461(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 40
LDI r2, 461
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
