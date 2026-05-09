; DESCRIPTION: Renders a red line between points (247, 122) and (210, 65).
; PLAN: r0=247(x1), r1=122(y1), r2=210(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 122
LDI r2, 210
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
