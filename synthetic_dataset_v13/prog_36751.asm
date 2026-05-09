; DESCRIPTION: Composite: Places a red dot at position (423, 240) then Draws a yellow rectangle at (12, 156) with width 102 and height 98 then Places a black circle of radius 37 at center (435, 80).
; PLAN: r0=423(x), r1=240(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=12(x), r6=156(y), r7=102(width), r8=98(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x), r11=80(y), r12=37(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 423
LDI r1, 240
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 12
LDI r6, 156
LDI r7, 102
LDI r8, 98
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 80
LDI r12, 37
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
