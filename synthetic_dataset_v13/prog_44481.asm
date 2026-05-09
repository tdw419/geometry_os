; DESCRIPTION: Renders a black line between points (306, 178) and (175, 93).
; PLAN: r0=306(x1), r1=178(y1), r2=175(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 178
LDI r2, 175
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
