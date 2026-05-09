; DESCRIPTION: Renders a cyan line between points (274, 136) and (253, 197).
; PLAN: r0=274(x1), r1=136(y1), r2=253(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 136
LDI r2, 253
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
