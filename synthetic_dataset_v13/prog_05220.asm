; DESCRIPTION: Renders a red line between points (53, 213) and (109, 205).
; PLAN: r0=53(x1), r1=213(y1), r2=109(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 213
LDI r2, 109
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
