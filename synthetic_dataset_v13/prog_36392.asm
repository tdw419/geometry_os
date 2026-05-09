; DESCRIPTION: Composite: Creates a orange circular shape at (432, 114) with radius 72 then Draws a blue rectangle at (298, 160) with width 92 and height 56.
; PLAN: r0=432(x), r1=114(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=160(y), r7=92(width), r8=56(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 114
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 160
LDI r7, 92
LDI r8, 56
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
