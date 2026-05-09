; DESCRIPTION: Composite: Draws a black circle centered at (368, 140) with radius 39 then Draws a orange rectangle at (160, 28) with width 15 and height 86.
; PLAN: r0=368(x), r1=140(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=28(y), r7=15(width), r8=86(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 140
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 28
LDI r7, 15
LDI r8, 86
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
