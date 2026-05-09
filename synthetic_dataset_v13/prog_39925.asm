; DESCRIPTION: Composite: Places a red 76x32 rectangle at position (371, 154) then Renders a purple disk with center (278, 73) and radius 13 then Sets a single green pixel at (222, 107).
; PLAN: r0=371(x), r1=154(y), r2=76(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=73(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x), r11=107(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 154
LDI r2, 76
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 73
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 107
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
