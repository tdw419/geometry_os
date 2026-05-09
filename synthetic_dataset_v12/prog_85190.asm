; DESCRIPTION: Composite: Places a orange 84x14 rectangle at position (129, 170) then Places a red dot at position (435, 75) then Places a white circle of radius 79 at center (268, 144).
; PLAN: r0=129(x), r1=170(y), r2=84(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=75(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=268(x), r11=144(y), r12=79(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 170
LDI r2, 84
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 75
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 268
LDI r11, 144
LDI r12, 79
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
