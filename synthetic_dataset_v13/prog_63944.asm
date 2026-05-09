; DESCRIPTION: Renders a red line between points (228, 227) and (5, 138).
; PLAN: r0=228(x1), r1=227(y1), r2=5(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 227
LDI r2, 5
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
