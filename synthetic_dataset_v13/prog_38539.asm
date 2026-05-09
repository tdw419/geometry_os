; DESCRIPTION: Renders a red line between points (274, 17) and (3, 236).
; PLAN: r0=274(x1), r1=17(y1), r2=3(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 17
LDI r2, 3
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
