; DESCRIPTION: Renders a blue line between points (93, 9) and (264, 213).
; PLAN: r0=93(x1), r1=9(y1), r2=264(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 9
LDI r2, 264
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
