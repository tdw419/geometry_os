; DESCRIPTION: Composite: Places a orange dot at position (33, 236) then Draws a white rectangle at (103, 1) with width 45 and height 102 then Creates a cyan circular shape at (344, 182) with radius 45.
; PLAN: r0=33(x), r1=236(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=1(y), r7=45(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x), r11=182(y), r12=45(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 236
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 103
LDI r6, 1
LDI r7, 45
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 182
LDI r12, 45
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
