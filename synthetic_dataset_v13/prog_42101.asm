; DESCRIPTION: Renders a yellow line between points (295, 140) and (230, 158).
; PLAN: r0=295(x1), r1=140(y1), r2=230(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 140
LDI r2, 230
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
