; DESCRIPTION: Composite: Sets a single black pixel at (347, 45) then Renders a purple box of size 65x86 starting at (256, 115) then Places a red circle of radius 29 at center (299, 61).
; PLAN: r0=347(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=115(y), r7=65(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=299(x), r11=61(y), r12=29(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 45
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 256
LDI r6, 115
LDI r7, 65
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 61
LDI r12, 29
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
