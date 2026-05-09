; DESCRIPTION: Composite: Places a red dot at position (96, 116) then Creates a red circular shape at (30, 172) with radius 17 then Places a white 45x22 rectangle at position (299, 68).
; PLAN: r0=96(x), r1=116(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=172(y), r7=17(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=299(x), r11=68(y), r12=45(width), r13=22(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 116
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 30
LDI r6, 172
LDI r7, 17
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 299
LDI r11, 68
LDI r12, 45
LDI r13, 22
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
