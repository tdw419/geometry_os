; DESCRIPTION: Composite: Places a cyan circle of radius 20 at center (348, 154) then Places a green dot at position (52, 104) then Creates a magenta rectangular region at (74, 6) spanning 45 by 35 pixels.
; PLAN: r0=348(x), r1=154(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=104(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=74(x), r11=6(y), r12=45(width), r13=35(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 154
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 104
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 74
LDI r11, 6
LDI r12, 45
LDI r13, 35
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
