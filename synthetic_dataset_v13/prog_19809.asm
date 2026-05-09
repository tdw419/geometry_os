; DESCRIPTION: Renders a white line between points (105, 188) and (350, 93).
; PLAN: r0=105(x1), r1=188(y1), r2=350(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 188
LDI r2, 350
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
