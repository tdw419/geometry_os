; DESCRIPTION: Composite: Draws a magenta rectangle at (270, 69) with width 120 and height 100 then Renders a orange disk with center (392, 116) and radius 63.
; PLAN: r0=270(x), r1=69(y), r2=120(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=116(y), r7=63(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 270
LDI r1, 69
LDI r2, 120
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 116
LDI r7, 63
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
