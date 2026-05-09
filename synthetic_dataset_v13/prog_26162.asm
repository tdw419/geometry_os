; DESCRIPTION: Composite: Sets a single black pixel at (69, 104) then Draws a red rectangle at (307, 82) with width 97 and height 29 then Draws a yellow circle centered at (189, 112) with radius 47.
; PLAN: r0=69(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=82(y), r7=97(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=189(x), r11=112(y), r12=47(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 104
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 307
LDI r6, 82
LDI r7, 97
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 112
LDI r12, 47
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
