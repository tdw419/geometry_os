; DESCRIPTION: Renders a blue line between points (96, 208) and (246, 29).
; PLAN: r0=96(x1), r1=208(y1), r2=246(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 208
LDI r2, 246
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
