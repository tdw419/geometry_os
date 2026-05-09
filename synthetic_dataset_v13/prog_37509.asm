; DESCRIPTION: Composite: Draws a orange rectangle at (27, 26) with width 95 and height 90 then Creates a magenta circular shape at (392, 155) with radius 77.
; PLAN: r0=27(x), r1=26(y), r2=95(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=155(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 27
LDI r1, 26
LDI r2, 95
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 155
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
