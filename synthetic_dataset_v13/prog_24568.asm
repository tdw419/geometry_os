; DESCRIPTION: Composite: Creates a orange circular shape at (421, 104) with radius 72 then Renders a red box of size 115x59 starting at (235, 108) then Places a orange dot at position (252, 9).
; PLAN: r0=421(x), r1=104(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=108(y), r7=115(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=252(x), r11=9(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 104
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 108
LDI r7, 115
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 9
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
