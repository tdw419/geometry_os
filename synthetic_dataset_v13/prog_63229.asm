; DESCRIPTION: Renders a green line between points (332, 216) and (165, 37).
; PLAN: r0=332(x1), r1=216(y1), r2=165(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 216
LDI r2, 165
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
