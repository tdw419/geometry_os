; DESCRIPTION: Composite: Sets a single red pixel at (341, 12) then Draws a black circle centered at (450, 48) with radius 40 then Draws a orange rectangle at (78, 120) with width 12 and height 71.
; PLAN: r0=341(x), r1=12(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=48(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=78(x), r11=120(y), r12=12(width), r13=71(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 12
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 450
LDI r6, 48
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 78
LDI r11, 120
LDI r12, 12
LDI r13, 71
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
