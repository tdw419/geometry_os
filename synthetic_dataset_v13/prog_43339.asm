; DESCRIPTION: Composite: Draws a white rectangle at (386, 46) with width 116 and height 84 then Renders a magenta disk with center (164, 170) and radius 10.
; PLAN: r0=386(x), r1=46(y), r2=116(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=170(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 386
LDI r1, 46
LDI r2, 116
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 170
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
