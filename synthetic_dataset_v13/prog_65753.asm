; DESCRIPTION: Composite: Renders a orange line between points (256, 86) and (442, 38) then Places a red dot at position (257, 240) then Creates a cyan rectangular region at (474, 169) spanning 28 by 13 pixels.
; PLAN: r0=256(x1), r1=86(y1), r2=442(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=240(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=474(x), r11=169(y), r12=28(width), r13=13(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 86
LDI r2, 442
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 240
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 474
LDI r11, 169
LDI r12, 28
LDI r13, 13
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
