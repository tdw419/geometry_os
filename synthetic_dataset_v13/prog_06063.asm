; DESCRIPTION: Renders a blue line between points (186, 140) and (229, 209).
; PLAN: r0=186(x1), r1=140(y1), r2=229(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 140
LDI r2, 229
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
