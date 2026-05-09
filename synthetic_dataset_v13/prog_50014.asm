; DESCRIPTION: Renders a red line between points (299, 40) and (288, 101).
; PLAN: r0=299(x1), r1=40(y1), r2=288(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 40
LDI r2, 288
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
