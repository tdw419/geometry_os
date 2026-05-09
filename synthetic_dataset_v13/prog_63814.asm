; DESCRIPTION: Renders a yellow line between points (133, 149) and (75, 246).
; PLAN: r0=133(x1), r1=149(y1), r2=75(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 149
LDI r2, 75
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
