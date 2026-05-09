; DESCRIPTION: Composite: Sets a single cyan pixel at (172, 178) then Creates a blue circular shape at (174, 174) with radius 13 then Renders a orange box of size 56x14 starting at (256, 4).
; PLAN: r0=172(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=174(y), r7=13(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x), r11=4(y), r12=56(width), r13=14(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 174
LDI r7, 13
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 4
LDI r12, 56
LDI r13, 14
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
