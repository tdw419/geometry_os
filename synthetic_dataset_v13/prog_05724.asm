; DESCRIPTION: Composite: Sets a single red pixel at (309, 182) then Draws a purple circle centered at (398, 196) with radius 50 then Draws a magenta rectangle at (421, 41) with width 56 and height 27.
; PLAN: r0=309(x), r1=182(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=196(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=421(x), r11=41(y), r12=56(width), r13=27(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 182
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 398
LDI r6, 196
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 421
LDI r11, 41
LDI r12, 56
LDI r13, 27
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
