; DESCRIPTION: Composite: Sets a single orange pixel at (194, 52) then Places a blue circle of radius 16 at center (399, 190) then Draws a blue rectangle at (440, 165) with width 24 and height 50.
; PLAN: r0=194(x), r1=52(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=190(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x), r11=165(y), r12=24(width), r13=50(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 52
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 399
LDI r6, 190
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 165
LDI r12, 24
LDI r13, 50
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
