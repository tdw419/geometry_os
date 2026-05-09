; DESCRIPTION: Composite: Creates a blue rectangular region at (218, 52) spanning 68 by 94 pixels then Renders a orange disk with center (176, 173) and radius 47.
; PLAN: r0=218(x), r1=52(y), r2=68(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=173(y), r7=47(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 218
LDI r1, 52
LDI r2, 68
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 173
LDI r7, 47
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
