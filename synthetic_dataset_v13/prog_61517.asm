; DESCRIPTION: Composite: Places a purple dot at position (274, 245) then Creates a orange rectangular region at (23, 93) spanning 99 by 53 pixels then Places a green circle of radius 38 at center (274, 39).
; PLAN: r0=274(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=23(x), r6=93(y), r7=99(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=274(x), r11=39(y), r12=38(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 245
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 23
LDI r6, 93
LDI r7, 99
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 39
LDI r12, 38
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
