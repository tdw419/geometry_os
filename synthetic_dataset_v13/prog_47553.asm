; DESCRIPTION: Renders a white line between points (188, 15) and (207, 73).
; PLAN: r0=188(x1), r1=15(y1), r2=207(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 15
LDI r2, 207
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
