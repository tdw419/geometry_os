; DESCRIPTION: Composite: Sets a single orange pixel at (459, 190) then Draws a green rectangle at (329, 151) with width 25 and height 26 then Creates a green circular shape at (409, 191) with radius 54.
; PLAN: r0=459(x), r1=190(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=329(x), r6=151(y), r7=25(width), r8=26(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x), r11=191(y), r12=54(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 459
LDI r1, 190
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 329
LDI r6, 151
LDI r7, 25
LDI r8, 26
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 191
LDI r12, 54
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
