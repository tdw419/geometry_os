; DESCRIPTION: Composite: Places a orange circle of radius 73 at center (201, 170) then Renders a blue box of size 40x104 starting at (385, 86) then Places a yellow dot at position (59, 81).
; PLAN: r0=201(x), r1=170(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=86(y), r7=40(width), r8=104(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=59(x), r11=81(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 170
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 86
LDI r7, 40
LDI r8, 104
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 81
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
