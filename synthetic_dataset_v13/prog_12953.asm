; DESCRIPTION: Composite: Sets a single black pixel at (122, 97) then Draws a magenta rectangle at (21, 44) with width 108 and height 25 then Places a yellow line segment connecting (494, 37) to (228, 245).
; PLAN: r0=122(x), r1=97(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=21(x), r6=44(y), r7=108(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=494(x1), r11=37(y1), r12=228(x2), r13=245(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 97
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 21
LDI r6, 44
LDI r7, 108
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 494
LDI r11, 37
LDI r12, 228
LDI r13, 245
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
