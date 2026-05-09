; DESCRIPTION: Composite: Creates a white rectangular region at (279, 229) spanning 37 by 24 pixels then Renders a yellow disk with center (344, 87) and radius 60.
; PLAN: r0=279(x), r1=229(y), r2=37(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=87(y), r7=60(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 229
LDI r2, 37
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 87
LDI r7, 60
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
