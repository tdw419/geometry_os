; DESCRIPTION: Composite: Creates a cyan rectangular region at (159, 129) spanning 65 by 10 pixels then Draws a blue circle centered at (255, 189) with radius 22.
; PLAN: r0=159(x), r1=129(y), r2=65(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=189(y), r7=22(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 159
LDI r1, 129
LDI r2, 65
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 189
LDI r7, 22
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
