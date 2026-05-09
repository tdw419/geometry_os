; DESCRIPTION: Composite: Renders a yellow line between points (58, 108) and (167, 189) then Creates a magenta circular shape at (402, 74) with radius 65.
; PLAN: r0=58(x1), r1=108(y1), r2=167(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=74(y), r7=65(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 108
LDI r2, 167
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 74
LDI r7, 65
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
