; DESCRIPTION: Renders a red line between points (188, 215) and (106, 103).
; PLAN: r0=188(x1), r1=215(y1), r2=106(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 215
LDI r2, 106
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
