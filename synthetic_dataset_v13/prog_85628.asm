; DESCRIPTION: Renders a red line between points (70, 154) and (73, 26).
; PLAN: r0=70(x1), r1=154(y1), r2=73(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 154
LDI r2, 73
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
