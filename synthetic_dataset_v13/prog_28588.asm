; DESCRIPTION: Composite: Renders a magenta disk with center (261, 105) and radius 58 then Sets a single yellow pixel at (218, 244) then Places a cyan 118x76 rectangle at position (10, 28).
; PLAN: r0=261(x), r1=105(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=244(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=10(x), r11=28(y), r12=118(width), r13=76(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 105
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 244
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 10
LDI r11, 28
LDI r12, 118
LDI r13, 76
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
