; DESCRIPTION: Renders a red line between points (362, 62) and (229, 100).
; PLAN: r0=362(x1), r1=62(y1), r2=229(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 62
LDI r2, 229
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
