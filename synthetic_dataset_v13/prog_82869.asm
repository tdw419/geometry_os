; DESCRIPTION: Renders a red line between points (149, 38) and (168, 157).
; PLAN: r0=149(x1), r1=38(y1), r2=168(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 38
LDI r2, 168
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
