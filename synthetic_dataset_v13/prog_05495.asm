; DESCRIPTION: Composite: Places a white 80x91 rectangle at position (377, 124) then Places a orange dot at position (466, 179) then Creates a cyan circular shape at (261, 222) with radius 19.
; PLAN: r0=377(x), r1=124(y), r2=80(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x), r6=179(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=261(x), r11=222(y), r12=19(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 377
LDI r1, 124
LDI r2, 80
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 179
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 261
LDI r11, 222
LDI r12, 19
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
