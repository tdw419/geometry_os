; DESCRIPTION: Renders a white line between points (68, 40) and (494, 179).
; PLAN: r0=68(x1), r1=40(y1), r2=494(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 40
LDI r2, 494
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
