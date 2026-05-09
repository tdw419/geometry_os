; DESCRIPTION: Renders a black line between points (193, 175) and (107, 75).
; PLAN: r0=193(x1), r1=175(y1), r2=107(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 175
LDI r2, 107
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
