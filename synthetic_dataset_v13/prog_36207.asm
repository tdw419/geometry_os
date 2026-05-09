; DESCRIPTION: Composite: Renders a cyan box of size 103x32 starting at (385, 82) then Places a yellow dot at position (28, 244) then Creates a orange circular shape at (420, 191) with radius 52.
; PLAN: r0=385(x), r1=82(y), r2=103(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=28(x), r6=244(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=420(x), r11=191(y), r12=52(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 82
LDI r2, 103
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 244
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 420
LDI r11, 191
LDI r12, 52
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
