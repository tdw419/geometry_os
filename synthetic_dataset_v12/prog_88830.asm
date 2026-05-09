; DESCRIPTION: Composite: Renders a blue disk with center (72, 199) and radius 29 then Creates a magenta rectangular region at (245, 172) spanning 70 by 70 pixels.
; PLAN: r0=72(x), r1=199(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x), r6=172(y), r7=70(width), r8=70(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 199
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 172
LDI r7, 70
LDI r8, 70
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
