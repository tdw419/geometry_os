; DESCRIPTION: Composite: Draws a green line from (134, 183) to (161, 192) then Renders a purple disk with center (208, 165) and radius 43.
; PLAN: r0=134(x1), r1=183(y1), r2=161(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=165(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 134
LDI r1, 183
LDI r2, 161
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 165
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
