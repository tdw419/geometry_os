; DESCRIPTION: Renders a red line between points (11, 103) and (299, 136).
; PLAN: r0=11(x1), r1=103(y1), r2=299(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 103
LDI r2, 299
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
