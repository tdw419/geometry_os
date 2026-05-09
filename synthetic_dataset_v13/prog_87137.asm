; DESCRIPTION: Renders a red line between points (174, 14) and (214, 44).
; PLAN: r0=174(x1), r1=14(y1), r2=214(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 14
LDI r2, 214
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
