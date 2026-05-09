; DESCRIPTION: Renders a green line between points (170, 158) and (230, 242).
; PLAN: r0=170(x1), r1=158(y1), r2=230(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 158
LDI r2, 230
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
