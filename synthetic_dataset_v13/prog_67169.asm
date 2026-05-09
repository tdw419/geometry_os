; DESCRIPTION: Composite: Places a yellow circle of radius 37 at center (69, 183) then Creates a cyan rectangular region at (165, 28) spanning 63 by 118 pixels then Sets a single orange pixel at (284, 5).
; PLAN: r0=69(x), r1=183(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=28(y), r7=63(width), r8=118(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=284(x), r11=5(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 183
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 28
LDI r7, 63
LDI r8, 118
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 5
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
