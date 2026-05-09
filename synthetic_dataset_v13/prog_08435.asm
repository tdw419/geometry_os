; DESCRIPTION: Composite: Places a black dot at position (428, 128) then Draws a magenta rectangle at (182, 191) with width 77 and height 20 then Draws a yellow circle centered at (83, 107) with radius 44.
; PLAN: r0=428(x), r1=128(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=191(y), r7=77(width), r8=20(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=83(x), r11=107(y), r12=44(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 428
LDI r1, 128
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 182
LDI r6, 191
LDI r7, 77
LDI r8, 20
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 107
LDI r12, 44
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
