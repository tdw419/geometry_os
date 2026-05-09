; DESCRIPTION: Renders a red line between points (303, 246) and (237, 156).
; PLAN: r0=303(x1), r1=246(y1), r2=237(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 246
LDI r2, 237
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
