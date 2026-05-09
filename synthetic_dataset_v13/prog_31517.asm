; DESCRIPTION: Composite: Places a orange 67x10 rectangle at position (91, 244) then Places a orange circle of radius 59 at center (163, 128) then Places a white dot at position (129, 247).
; PLAN: r0=91(x), r1=244(y), r2=67(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x), r6=128(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=129(x), r11=247(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 244
LDI r2, 67
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 128
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 129
LDI r11, 247
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
