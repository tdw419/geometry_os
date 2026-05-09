; DESCRIPTION: Composite: Sets a single black pixel at (111, 7) then Draws a yellow circle centered at (210, 106) with radius 31 then Places a red 66x109 rectangle at position (162, 15).
; PLAN: r0=111(x), r1=7(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=106(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x), r11=15(y), r12=66(width), r13=109(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 7
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 210
LDI r6, 106
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 15
LDI r12, 66
LDI r13, 109
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
