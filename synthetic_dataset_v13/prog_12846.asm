; DESCRIPTION: Renders a white line between points (26, 70) and (123, 96).
; PLAN: r0=26(x1), r1=70(y1), r2=123(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 70
LDI r2, 123
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
