; DESCRIPTION: Renders a black line between points (49, 180) and (65, 187).
; PLAN: r0=49(x1), r1=180(y1), r2=65(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 180
LDI r2, 65
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
