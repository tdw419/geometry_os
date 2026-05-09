; DESCRIPTION: Renders a green line between points (186, 171) and (188, 81).
; PLAN: r0=186(x1), r1=171(y1), r2=188(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 171
LDI r2, 188
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
