; DESCRIPTION: Renders a green line between points (188, 187) and (473, 191).
; PLAN: r0=188(x1), r1=187(y1), r2=473(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 187
LDI r2, 473
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
