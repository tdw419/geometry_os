; DESCRIPTION: Renders a red line between points (202, 21) and (274, 123).
; PLAN: r0=202(x1), r1=21(y1), r2=274(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 21
LDI r2, 274
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
