; DESCRIPTION: Renders a green line between points (303, 168) and (188, 116).
; PLAN: r0=303(x1), r1=168(y1), r2=188(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 168
LDI r2, 188
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
