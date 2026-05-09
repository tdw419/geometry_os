; DESCRIPTION: Renders a red line between points (0, 97) and (437, 23).
; PLAN: r0=0(x1), r1=97(y1), r2=437(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 97
LDI r2, 437
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
