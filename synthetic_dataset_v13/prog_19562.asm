; DESCRIPTION: Composite: Draws a red rectangle at (228, 99) with width 95 and height 48 then Creates a red circular shape at (122, 79) with radius 77.
; PLAN: r0=228(x), r1=99(y), r2=95(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=79(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 99
LDI r2, 95
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 79
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
