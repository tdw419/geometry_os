; DESCRIPTION: Renders a white line between points (430, 53) and (220, 199).
; PLAN: r0=430(x1), r1=53(y1), r2=220(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 53
LDI r2, 220
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
