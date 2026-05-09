; DESCRIPTION: Composite: Renders a magenta disk with center (98, 165) and radius 47 then Places a yellow line segment connecting (474, 187) to (142, 166).
; PLAN: r0=98(x), r1=165(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x1), r6=187(y1), r7=142(x2), r8=166(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 165
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 187
LDI r7, 142
LDI r8, 166
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
