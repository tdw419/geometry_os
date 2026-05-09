; DESCRIPTION: Renders a red line between points (44, 50) and (189, 214).
; PLAN: r0=44(x1), r1=50(y1), r2=189(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 50
LDI r2, 189
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
