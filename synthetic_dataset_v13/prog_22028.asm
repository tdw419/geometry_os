; DESCRIPTION: Composite: Draws a cyan circle centered at (449, 43) with radius 30 then Sets a single yellow pixel at (453, 5) then Draws a black rectangle at (245, 126) with width 92 and height 32.
; PLAN: r0=449(x), r1=43(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x), r6=5(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=245(x), r11=126(y), r12=92(width), r13=32(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 43
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 5
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 245
LDI r11, 126
LDI r12, 92
LDI r13, 32
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
