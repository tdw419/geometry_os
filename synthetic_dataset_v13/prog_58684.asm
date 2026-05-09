; DESCRIPTION: Renders a red line between points (15, 166) and (420, 71).
; PLAN: r0=15(x1), r1=166(y1), r2=420(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 166
LDI r2, 420
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
