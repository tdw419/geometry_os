; DESCRIPTION: Renders a yellow line between points (66, 230) and (8, 121).
; PLAN: r0=66(x1), r1=230(y1), r2=8(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 230
LDI r2, 8
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
