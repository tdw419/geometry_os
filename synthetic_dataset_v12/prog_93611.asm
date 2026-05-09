; DESCRIPTION: Renders a red line between points (65, 246) and (209, 30).
; PLAN: r0=65(x1), r1=246(y1), r2=209(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 246
LDI r2, 209
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
