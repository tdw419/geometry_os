; DESCRIPTION: Renders a red line between points (44, 28) and (498, 141).
; PLAN: r0=44(x1), r1=28(y1), r2=498(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 28
LDI r2, 498
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
