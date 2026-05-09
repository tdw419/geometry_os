; DESCRIPTION: Renders a white line between points (7, 93) and (101, 189).
; PLAN: r0=7(x1), r1=93(y1), r2=101(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 93
LDI r2, 101
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
