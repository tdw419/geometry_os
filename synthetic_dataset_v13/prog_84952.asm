; DESCRIPTION: Composite: Creates a cyan rectangular region at (219, 65) spanning 59 by 87 pixels then Renders a white disk with center (86, 107) and radius 59.
; PLAN: r0=219(x), r1=65(y), r2=59(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=107(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 219
LDI r1, 65
LDI r2, 59
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 107
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
