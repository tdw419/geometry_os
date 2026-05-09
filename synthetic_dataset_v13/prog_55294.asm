; DESCRIPTION: Renders a red line between points (174, 55) and (252, 24).
; PLAN: r0=174(x1), r1=55(y1), r2=252(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 55
LDI r2, 252
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
