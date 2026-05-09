; DESCRIPTION: Composite: Places a blue circle of radius 26 at center (450, 54) then Places a orange dot at position (162, 243) then Creates a white rectangular region at (224, 35) spanning 107 by 117 pixels.
; PLAN: r0=450(x), r1=54(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=243(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=224(x), r11=35(y), r12=107(width), r13=117(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 54
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 243
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 224
LDI r11, 35
LDI r12, 107
LDI r13, 117
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
