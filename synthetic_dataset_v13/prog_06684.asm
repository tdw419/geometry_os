; DESCRIPTION: Composite: Places a cyan 13x64 rectangle at position (166, 162) then Creates a orange circular shape at (359, 128) with radius 28 then Renders a black line between points (299, 107) and (493, 224).
; PLAN: r0=166(x), r1=162(y), r2=13(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x), r6=128(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=299(x1), r11=107(y1), r12=493(x2), r13=224(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 162
LDI r2, 13
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 128
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 299
LDI r11, 107
LDI r12, 493
LDI r13, 224
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
