; DESCRIPTION: Renders a green line between points (15, 162) and (230, 144).
; PLAN: r0=15(x1), r1=162(y1), r2=230(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 162
LDI r2, 230
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
