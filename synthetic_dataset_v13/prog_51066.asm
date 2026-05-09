; DESCRIPTION: Renders a green line between points (152, 9) and (159, 230).
; PLAN: r0=152(x1), r1=9(y1), r2=159(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 9
LDI r2, 159
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
