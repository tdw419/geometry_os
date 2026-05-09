; DESCRIPTION: Renders a red line between points (300, 73) and (124, 13).
; PLAN: r0=300(x1), r1=73(y1), r2=124(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 73
LDI r2, 124
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
