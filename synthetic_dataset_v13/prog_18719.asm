; DESCRIPTION: Composite: Creates a blue circular shape at (340, 52) with radius 12 then Sets a single cyan pixel at (301, 11) then Draws a magenta rectangle at (167, 14) with width 97 and height 32.
; PLAN: r0=340(x), r1=52(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x), r6=11(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=167(x), r11=14(y), r12=97(width), r13=32(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 52
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 11
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 167
LDI r11, 14
LDI r12, 97
LDI r13, 32
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
