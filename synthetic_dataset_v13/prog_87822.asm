; DESCRIPTION: Composite: Renders a magenta disk with center (425, 108) and radius 79 then Creates a white rectangular region at (64, 114) spanning 30 by 69 pixels.
; PLAN: r0=425(x), r1=108(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x), r6=114(y), r7=30(width), r8=69(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 108
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 114
LDI r7, 30
LDI r8, 69
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
