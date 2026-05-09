; DESCRIPTION: Renders a white line between points (26, 172) and (416, 33).
; PLAN: r0=26(x1), r1=172(y1), r2=416(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 172
LDI r2, 416
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
