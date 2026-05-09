; DESCRIPTION: Renders a white line between points (186, 105) and (86, 87).
; PLAN: r0=186(x1), r1=105(y1), r2=86(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 105
LDI r2, 86
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
