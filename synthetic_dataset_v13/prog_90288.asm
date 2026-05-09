; DESCRIPTION: Composite: Creates a magenta circular shape at (300, 166) with radius 63 then Renders a yellow line between points (96, 213) and (222, 64).
; PLAN: r0=300(x), r1=166(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x1), r6=213(y1), r7=222(x2), r8=64(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 166
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 213
LDI r7, 222
LDI r8, 64
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
