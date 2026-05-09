; DESCRIPTION: Composite: Renders a black disk with center (145, 95) and radius 59 then Draws a blue rectangle at (240, 148) with width 25 and height 44.
; PLAN: r0=145(x), r1=95(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=148(y), r7=25(width), r8=44(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 95
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 148
LDI r7, 25
LDI r8, 44
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
