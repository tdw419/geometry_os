; DESCRIPTION: Composite: Places a orange dot at position (400, 242) then Draws a magenta rectangle at (42, 105) with width 93 and height 76 then Renders a black disk with center (201, 139) and radius 78.
; PLAN: r0=400(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=105(y), r7=93(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x), r11=139(y), r12=78(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 400
LDI r1, 242
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 42
LDI r6, 105
LDI r7, 93
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 139
LDI r12, 78
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
