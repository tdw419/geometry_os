; DESCRIPTION: Renders a green line between points (216, 240) and (329, 98).
; PLAN: r0=216(x1), r1=240(y1), r2=329(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 240
LDI r2, 329
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
