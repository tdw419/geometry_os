; DESCRIPTION: Renders a green line between points (8, 186) and (15, 121).
; PLAN: r0=8(x1), r1=186(y1), r2=15(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 186
LDI r2, 15
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
