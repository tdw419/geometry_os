; DESCRIPTION: Composite: Places a black circle of radius 33 at center (203, 157) then Places a orange dot at position (39, 25) then Places a green 39x12 rectangle at position (157, 42).
; PLAN: r0=203(x), r1=157(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=25(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=157(x), r11=42(y), r12=39(width), r13=12(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 157
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 25
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 157
LDI r11, 42
LDI r12, 39
LDI r13, 12
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
