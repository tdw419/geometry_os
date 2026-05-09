; DESCRIPTION: Renders a cyan line between points (253, 43) and (175, 163).
; PLAN: r0=253(x1), r1=43(y1), r2=175(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 43
LDI r2, 175
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
