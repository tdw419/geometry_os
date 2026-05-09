; DESCRIPTION: Composite: Sets a single yellow pixel at (261, 217) then Places a green 21x111 rectangle at position (311, 140) then Creates a cyan circular shape at (161, 72) with radius 24.
; PLAN: r0=261(x), r1=217(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=140(y), r7=21(width), r8=111(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x), r11=72(y), r12=24(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 261
LDI r1, 217
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 311
LDI r6, 140
LDI r7, 21
LDI r8, 111
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 72
LDI r12, 24
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
