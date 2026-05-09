; DESCRIPTION: Composite: Draws a magenta circle centered at (52, 103) with radius 48 then Renders a yellow line between points (126, 11) and (91, 245).
; PLAN: r0=52(x), r1=103(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x1), r6=11(y1), r7=91(x2), r8=245(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 103
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 11
LDI r7, 91
LDI r8, 245
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
