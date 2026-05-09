; DESCRIPTION: Renders a white line between points (91, 0) and (12, 79).
; PLAN: r0=91(x1), r1=0(y1), r2=12(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 0
LDI r2, 12
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
