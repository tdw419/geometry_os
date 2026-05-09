; DESCRIPTION: Composite: Draws a magenta circle centered at (325, 52) with radius 42 then Renders a green line between points (500, 130) and (274, 163).
; PLAN: r0=325(x), r1=52(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=500(x1), r6=130(y1), r7=274(x2), r8=163(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 52
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 500
LDI r6, 130
LDI r7, 274
LDI r8, 163
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
