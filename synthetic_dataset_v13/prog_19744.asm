; DESCRIPTION: Renders a red line between points (425, 231) and (88, 62).
; PLAN: r0=425(x1), r1=231(y1), r2=88(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 231
LDI r2, 88
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
