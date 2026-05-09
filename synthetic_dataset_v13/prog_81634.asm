; DESCRIPTION: Renders a white line between points (68, 250) and (342, 52).
; PLAN: r0=68(x1), r1=250(y1), r2=342(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 250
LDI r2, 342
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
