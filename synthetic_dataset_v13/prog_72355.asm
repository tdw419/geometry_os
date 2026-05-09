; DESCRIPTION: Composite: Creates a black rectangular region at (150, 209) spanning 48 by 47 pixels then Renders a blue disk with center (154, 151) and radius 75.
; PLAN: r0=150(x), r1=209(y), r2=48(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=151(y), r7=75(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 150
LDI r1, 209
LDI r2, 48
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 151
LDI r7, 75
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
