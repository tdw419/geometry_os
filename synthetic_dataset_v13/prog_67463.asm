; DESCRIPTION: Renders a red line between points (139, 168) and (188, 128).
; PLAN: r0=139(x1), r1=168(y1), r2=188(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 168
LDI r2, 188
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
