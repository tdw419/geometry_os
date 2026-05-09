; DESCRIPTION: Composite: Creates a red rectangular region at (255, 12) spanning 110 by 48 pixels then Renders a blue disk with center (345, 151) and radius 70.
; PLAN: r0=255(x), r1=12(y), r2=110(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=151(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 255
LDI r1, 12
LDI r2, 110
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 151
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
