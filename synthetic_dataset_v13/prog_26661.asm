; DESCRIPTION: Composite: Sets a single white pixel at (335, 123) then Draws a green rectangle at (385, 189) with width 10 and height 20 then Renders a magenta disk with center (213, 139) and radius 48.
; PLAN: r0=335(x), r1=123(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=189(y), r7=10(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=139(y), r12=48(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 335
LDI r1, 123
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 385
LDI r6, 189
LDI r7, 10
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 139
LDI r12, 48
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
