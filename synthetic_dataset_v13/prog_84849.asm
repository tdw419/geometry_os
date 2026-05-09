; DESCRIPTION: Composite: Sets a single orange pixel at (413, 160) then Places a cyan circle of radius 21 at center (341, 119) then Draws a red rectangle at (83, 190) with width 13 and height 30.
; PLAN: r0=413(x), r1=160(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=119(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=83(x), r11=190(y), r12=13(width), r13=30(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 160
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 341
LDI r6, 119
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 83
LDI r11, 190
LDI r12, 13
LDI r13, 30
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
