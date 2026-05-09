; DESCRIPTION: Composite: Places a cyan circle of radius 38 at center (256, 75) then Creates a white rectangular region at (120, 156) spanning 116 by 78 pixels then Places a white dot at position (474, 5).
; PLAN: r0=256(x), r1=75(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=156(y), r7=116(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=474(x), r11=5(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 75
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 156
LDI r7, 116
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 5
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
