; DESCRIPTION: Composite: Places a magenta 42x101 rectangle at position (235, 85) then Places a cyan dot at position (91, 23) then Draws a yellow circle centered at (112, 134) with radius 64.
; PLAN: r0=235(x), r1=85(y), r2=42(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x), r6=23(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=134(y), r12=64(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 235
LDI r1, 85
LDI r2, 42
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 23
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 112
LDI r11, 134
LDI r12, 64
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
