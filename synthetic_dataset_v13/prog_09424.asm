; DESCRIPTION: Renders a green line between points (175, 155) and (27, 69).
; PLAN: r0=175(x1), r1=155(y1), r2=27(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 155
LDI r2, 27
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
