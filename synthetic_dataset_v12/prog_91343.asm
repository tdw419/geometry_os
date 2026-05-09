; DESCRIPTION: Renders a white line between points (84, 24) and (311, 55).
; PLAN: r0=84(x1), r1=24(y1), r2=311(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 24
LDI r2, 311
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
