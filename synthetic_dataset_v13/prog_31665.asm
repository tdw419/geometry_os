; DESCRIPTION: Composite: Creates a orange rectangular region at (152, 16) spanning 93 by 15 pixels then Places a magenta circle of radius 26 at center (235, 225) then Places a purple dot at position (35, 111).
; PLAN: r0=152(x), r1=16(y), r2=93(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=225(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=35(x), r11=111(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 16
LDI r2, 93
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 225
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 35
LDI r11, 111
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
