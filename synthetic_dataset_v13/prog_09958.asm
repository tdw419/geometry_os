; DESCRIPTION: Renders a white line between points (89, 247) and (488, 97).
; PLAN: r0=89(x1), r1=247(y1), r2=488(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 247
LDI r2, 488
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
