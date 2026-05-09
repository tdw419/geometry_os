; DESCRIPTION: Renders a red line between points (101, 123) and (479, 189).
; PLAN: r0=101(x1), r1=123(y1), r2=479(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 123
LDI r2, 479
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
