; DESCRIPTION: Renders a green line between points (279, 101) and (20, 197).
; PLAN: r0=279(x1), r1=101(y1), r2=20(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 101
LDI r2, 20
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
