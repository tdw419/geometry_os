; DESCRIPTION: Composite: Creates a white circular shape at (160, 106) with radius 56 then Sets a single magenta pixel at (338, 184) then Creates a cyan rectangular region at (380, 154) spanning 95 by 32 pixels.
; PLAN: r0=160(x), r1=106(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=184(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=380(x), r11=154(y), r12=95(width), r13=32(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 106
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 184
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 380
LDI r11, 154
LDI r12, 95
LDI r13, 32
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
