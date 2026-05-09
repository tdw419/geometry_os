; DESCRIPTION: Composite: Creates a orange rectangular region at (213, 88) spanning 15 by 120 pixels then Places a blue circle of radius 76 at center (353, 90).
; PLAN: r0=213(x), r1=88(y), r2=15(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=90(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 213
LDI r1, 88
LDI r2, 15
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 90
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
