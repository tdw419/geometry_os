; DESCRIPTION: Renders a red line between points (63, 202) and (306, 109).
; PLAN: r0=63(x1), r1=202(y1), r2=306(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 202
LDI r2, 306
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
