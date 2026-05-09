; DESCRIPTION: Renders a red line between points (228, 170) and (408, 112).
; PLAN: r0=228(x1), r1=170(y1), r2=408(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 170
LDI r2, 408
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
