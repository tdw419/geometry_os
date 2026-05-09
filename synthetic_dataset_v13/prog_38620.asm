; DESCRIPTION: Renders a blue line between points (290, 249) and (141, 243).
; PLAN: r0=290(x1), r1=249(y1), r2=141(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 249
LDI r2, 141
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
