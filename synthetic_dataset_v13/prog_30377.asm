; DESCRIPTION: Composite: Sets a single cyan pixel at (464, 91) then Places a orange line segment connecting (39, 224) to (447, 31) then Places a white 66x23 rectangle at position (256, 56).
; PLAN: r0=464(x), r1=91(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=39(x1), r6=224(y1), r7=447(x2), r8=31(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=56(y), r12=66(width), r13=23(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 91
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 39
LDI r6, 224
LDI r7, 447
LDI r8, 31
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 56
LDI r12, 66
LDI r13, 23
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
