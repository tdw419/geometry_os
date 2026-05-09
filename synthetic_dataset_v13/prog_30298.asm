; DESCRIPTION: Composite: Sets a single cyan pixel at (447, 99) then Draws a red rectangle at (148, 140) with width 82 and height 114 then Creates a cyan circular shape at (113, 80) with radius 30.
; PLAN: r0=447(x), r1=99(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=140(y), r7=82(width), r8=114(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=113(x), r11=80(y), r12=30(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 447
LDI r1, 99
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 148
LDI r6, 140
LDI r7, 82
LDI r8, 114
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 80
LDI r12, 30
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
