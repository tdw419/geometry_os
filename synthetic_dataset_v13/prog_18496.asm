; DESCRIPTION: Composite: Places a magenta circle of radius 75 at center (166, 96) then Creates a yellow rectangular region at (119, 182) spanning 111 by 14 pixels then Places a green dot at position (198, 152).
; PLAN: r0=166(x), r1=96(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=182(y), r7=111(width), r8=14(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x), r11=152(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 166
LDI r1, 96
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 182
LDI r7, 111
LDI r8, 14
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 152
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
