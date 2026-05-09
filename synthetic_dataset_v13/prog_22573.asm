; DESCRIPTION: Composite: Draws a white rectangle at (350, 20) with width 82 and height 104 then Draws a cyan circle centered at (393, 191) with radius 32 then Places a white dot at position (294, 186).
; PLAN: r0=350(x), r1=20(y), r2=82(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=191(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=294(x), r11=186(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 350
LDI r1, 20
LDI r2, 82
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 191
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 294
LDI r11, 186
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
