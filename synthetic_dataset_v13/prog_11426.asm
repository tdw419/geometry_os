; DESCRIPTION: Renders a red line between points (496, 3) and (231, 209).
; PLAN: r0=496(x1), r1=3(y1), r2=231(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 3
LDI r2, 231
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
