; DESCRIPTION: Composite: Draws a white circle centered at (298, 156) with radius 12 then Draws a cyan rectangle at (107, 37) with width 20 and height 49 then Places a red dot at position (326, 216).
; PLAN: r0=298(x), r1=156(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=37(y), r7=20(width), r8=49(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=326(x), r11=216(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 298
LDI r1, 156
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 37
LDI r7, 20
LDI r8, 49
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 216
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
