; DESCRIPTION: Composite: Draws a white circle centered at (117, 222) with radius 25 then Draws a orange rectangle at (298, 89) with width 26 and height 27.
; PLAN: r0=117(x), r1=222(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=89(y), r7=26(width), r8=27(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 222
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 89
LDI r7, 26
LDI r8, 27
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
