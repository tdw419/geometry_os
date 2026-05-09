; DESCRIPTION: Renders a red line between points (227, 93) and (16, 244).
; PLAN: r0=227(x1), r1=93(y1), r2=16(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 93
LDI r2, 16
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
