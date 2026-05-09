; DESCRIPTION: Composite: Creates a green circular shape at (128, 110) with radius 37 then Draws a cyan rectangle at (132, 107) with width 23 and height 57.
; PLAN: r0=128(x), r1=110(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=107(y), r7=23(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 110
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 107
LDI r7, 23
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
