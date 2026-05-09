; DESCRIPTION: Composite: Draws a magenta rectangle at (81, 13) with width 118 and height 109 then Creates a yellow circular shape at (152, 120) with radius 64.
; PLAN: r0=81(x), r1=13(y), r2=118(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=120(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 81
LDI r1, 13
LDI r2, 118
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 120
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
