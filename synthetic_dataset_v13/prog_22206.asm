; DESCRIPTION: Composite: Creates a purple rectangular region at (156, 173) spanning 42 by 52 pixels then Renders a white disk with center (176, 213) and radius 14.
; PLAN: r0=156(x), r1=173(y), r2=42(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=213(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 173
LDI r2, 42
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 213
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
