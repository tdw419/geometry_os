; DESCRIPTION: Composite: Creates a orange rectangular region at (190, 12) spanning 94 by 32 pixels then Places a yellow circle of radius 45 at center (104, 87) then Sets a single black pixel at (256, 21).
; PLAN: r0=190(x), r1=12(y), r2=94(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=87(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x), r11=21(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 12
LDI r2, 94
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 87
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 21
LDI r12, 0x000000
PSET r10, r11, r12
HALT
