; DESCRIPTION: Composite: Renders a green line between points (235, 121) and (174, 71) then Renders a purple disk with center (69, 121) and radius 12.
; PLAN: r0=235(x1), r1=121(y1), r2=174(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=121(y), r7=12(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 121
LDI r2, 174
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 121
LDI r7, 12
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
