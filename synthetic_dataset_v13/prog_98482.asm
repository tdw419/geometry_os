; DESCRIPTION: Composite: Places a magenta dot at position (118, 211) then Places a cyan circle of radius 52 at center (188, 83) then Draws a orange rectangle at (104, 69) with width 27 and height 10.
; PLAN: r0=118(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=83(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=69(y), r12=27(width), r13=10(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 188
LDI r6, 83
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 69
LDI r12, 27
LDI r13, 10
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
