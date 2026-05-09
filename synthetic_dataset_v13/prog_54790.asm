; DESCRIPTION: Composite: Renders a black disk with center (186, 171) and radius 62 then Draws a blue rectangle at (450, 63) with width 33 and height 84.
; PLAN: r0=186(x), r1=171(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x), r6=63(y), r7=33(width), r8=84(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 171
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 63
LDI r7, 33
LDI r8, 84
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
