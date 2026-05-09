; DESCRIPTION: Renders a green line between points (498, 186) and (435, 74).
; PLAN: r0=498(x1), r1=186(y1), r2=435(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 186
LDI r2, 435
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
