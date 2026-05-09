; DESCRIPTION: Composite: Places a black dot at position (104, 90) then Places a magenta 10x22 rectangle at position (151, 65) then Creates a magenta circular shape at (227, 127) with radius 34.
; PLAN: r0=104(x), r1=90(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=151(x), r6=65(y), r7=10(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x), r11=127(y), r12=34(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 104
LDI r1, 90
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 151
LDI r6, 65
LDI r7, 10
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 127
LDI r12, 34
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
