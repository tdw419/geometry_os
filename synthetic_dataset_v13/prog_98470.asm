; DESCRIPTION: Composite: Draws a green line from (119, 138) to (346, 143) then Renders a purple disk with center (148, 199) and radius 47.
; PLAN: r0=119(x1), r1=138(y1), r2=346(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=199(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 119
LDI r1, 138
LDI r2, 346
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 199
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
