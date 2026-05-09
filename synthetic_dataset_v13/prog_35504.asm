; DESCRIPTION: Renders a red line between points (135, 23) and (265, 123).
; PLAN: r0=135(x1), r1=23(y1), r2=265(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 23
LDI r2, 265
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
