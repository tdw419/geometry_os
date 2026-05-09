; DESCRIPTION: Composite: Sets a single yellow pixel at (222, 55) then Places a blue 64x112 rectangle at position (380, 18) then Places a blue circle of radius 42 at center (145, 70).
; PLAN: r0=222(x), r1=55(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=18(y), r7=64(width), r8=112(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=145(x), r11=70(y), r12=42(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 222
LDI r1, 55
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 380
LDI r6, 18
LDI r7, 64
LDI r8, 112
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 70
LDI r12, 42
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
