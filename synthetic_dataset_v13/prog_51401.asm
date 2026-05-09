; DESCRIPTION: Composite: Renders a magenta disk with center (374, 165) and radius 75 then Renders a white line between points (475, 199) and (52, 209).
; PLAN: r0=374(x), r1=165(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x1), r6=199(y1), r7=52(x2), r8=209(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 165
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 199
LDI r7, 52
LDI r8, 209
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
