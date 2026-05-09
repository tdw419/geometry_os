; DESCRIPTION: Renders a white line between points (16, 172) and (47, 168).
; PLAN: r0=16(x1), r1=172(y1), r2=47(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 172
LDI r2, 47
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
