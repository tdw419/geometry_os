; DESCRIPTION: Renders a red line between points (90, 91) and (473, 45).
; PLAN: r0=90(x1), r1=91(y1), r2=473(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 91
LDI r2, 473
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
