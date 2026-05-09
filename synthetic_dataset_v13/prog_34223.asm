; DESCRIPTION: Renders a white line between points (180, 172) and (59, 119).
; PLAN: r0=180(x1), r1=172(y1), r2=59(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 172
LDI r2, 59
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
