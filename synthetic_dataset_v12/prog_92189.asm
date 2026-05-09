; DESCRIPTION: Renders a red line between points (16, 138) and (466, 126).
; PLAN: r0=16(x1), r1=138(y1), r2=466(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 138
LDI r2, 466
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
