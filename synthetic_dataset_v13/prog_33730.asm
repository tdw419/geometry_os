; DESCRIPTION: Renders a red line between points (42, 58) and (473, 79).
; PLAN: r0=42(x1), r1=58(y1), r2=473(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 58
LDI r2, 473
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
