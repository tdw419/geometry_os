; DESCRIPTION: Renders a red line between points (166, 210) and (423, 7).
; PLAN: r0=166(x1), r1=210(y1), r2=423(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 210
LDI r2, 423
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
