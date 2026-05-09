; DESCRIPTION: Renders a red line between points (492, 138) and (342, 47).
; PLAN: r0=492(x1), r1=138(y1), r2=342(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 138
LDI r2, 342
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
