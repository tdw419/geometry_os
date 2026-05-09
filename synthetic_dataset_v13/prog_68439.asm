; DESCRIPTION: Renders a red line between points (488, 94) and (65, 145).
; PLAN: r0=488(x1), r1=94(y1), r2=65(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 94
LDI r2, 65
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
