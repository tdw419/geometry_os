; DESCRIPTION: Renders a red line between points (133, 10) and (146, 63).
; PLAN: r0=133(x1), r1=10(y1), r2=146(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 10
LDI r2, 146
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
