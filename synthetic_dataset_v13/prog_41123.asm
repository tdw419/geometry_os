; DESCRIPTION: Renders a red line between points (166, 180) and (172, 191).
; PLAN: r0=166(x1), r1=180(y1), r2=172(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 180
LDI r2, 172
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
