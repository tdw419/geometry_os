; DESCRIPTION: Composite: Places a white 64x12 rectangle at position (271, 215) then Creates a cyan circular shape at (178, 224) with radius 28 then Places a green dot at position (28, 220).
; PLAN: r0=271(x), r1=215(y), r2=64(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=224(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=28(x), r11=220(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 215
LDI r2, 64
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 224
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 28
LDI r11, 220
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
