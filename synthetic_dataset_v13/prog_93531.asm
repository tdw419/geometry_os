; DESCRIPTION: Renders a red line between points (44, 202) and (182, 23).
; PLAN: r0=44(x1), r1=202(y1), r2=182(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 202
LDI r2, 182
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
