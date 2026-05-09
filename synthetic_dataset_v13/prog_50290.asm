; DESCRIPTION: Renders a red line between points (292, 138) and (333, 211).
; PLAN: r0=292(x1), r1=138(y1), r2=333(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 138
LDI r2, 333
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
