; DESCRIPTION: Composite: Places a orange circle of radius 26 at center (305, 53) then Creates a black rectangular region at (140, 115) spanning 15 by 27 pixels then Places a blue dot at position (317, 255).
; PLAN: r0=305(x), r1=53(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=115(y), r7=15(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=317(x), r11=255(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 53
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 115
LDI r7, 15
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 255
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
