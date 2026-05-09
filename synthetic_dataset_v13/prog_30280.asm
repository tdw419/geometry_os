; DESCRIPTION: Renders a red line between points (43, 12) and (321, 27).
; PLAN: r0=43(x1), r1=12(y1), r2=321(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 12
LDI r2, 321
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
