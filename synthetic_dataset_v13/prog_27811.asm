; DESCRIPTION: Composite: Draws a black circle centered at (410, 165) with radius 29 then Places a cyan 88x87 rectangle at position (95, 40) then Places a blue dot at position (324, 102).
; PLAN: r0=410(x), r1=165(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=95(x), r6=40(y), r7=88(width), r8=87(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=324(x), r11=102(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 410
LDI r1, 165
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 95
LDI r6, 40
LDI r7, 88
LDI r8, 87
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 324
LDI r11, 102
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
