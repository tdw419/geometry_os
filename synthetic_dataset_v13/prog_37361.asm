; DESCRIPTION: Renders a red line between points (23, 28) and (115, 66).
; PLAN: r0=23(x1), r1=28(y1), r2=115(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 28
LDI r2, 115
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
