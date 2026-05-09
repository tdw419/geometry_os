; DESCRIPTION: Composite: Draws a orange circle centered at (116, 93) with radius 67 then Renders a cyan box of size 21x48 starting at (22, 112) then Places a yellow dot at position (156, 56).
; PLAN: r0=116(x), r1=93(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x), r6=112(y), r7=21(width), r8=48(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=156(x), r11=56(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 93
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 112
LDI r7, 21
LDI r8, 48
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 56
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
