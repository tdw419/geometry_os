; DESCRIPTION: Renders a red line between points (280, 253) and (163, 19).
; PLAN: r0=280(x1), r1=253(y1), r2=163(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 253
LDI r2, 163
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
