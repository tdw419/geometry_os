; DESCRIPTION: Renders a white line between points (360, 71) and (68, 149).
; PLAN: r0=360(x1), r1=71(y1), r2=68(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 71
LDI r2, 68
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
