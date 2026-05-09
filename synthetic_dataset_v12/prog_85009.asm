; DESCRIPTION: Composite: Creates a white rectangular region at (262, 127) spanning 85 by 53 pixels then Places a blue dot at position (327, 110) then Places a orange circle of radius 25 at center (148, 156).
; PLAN: r0=262(x), r1=127(y), r2=85(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=110(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=148(x), r11=156(y), r12=25(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 262
LDI r1, 127
LDI r2, 85
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 110
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 148
LDI r11, 156
LDI r12, 25
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
