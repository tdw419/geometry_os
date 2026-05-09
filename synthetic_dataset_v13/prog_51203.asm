; DESCRIPTION: Renders a black line between points (250, 12) and (166, 54).
; PLAN: r0=250(x1), r1=12(y1), r2=166(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 12
LDI r2, 166
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
