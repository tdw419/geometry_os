; DESCRIPTION: Composite: Creates a yellow circular shape at (297, 92) with radius 27 then Sets a single red pixel at (452, 0) then Places a blue 11x105 rectangle at position (243, 97).
; PLAN: r0=297(x), r1=92(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x), r6=0(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=243(x), r11=97(y), r12=11(width), r13=105(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 92
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 0
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 243
LDI r11, 97
LDI r12, 11
LDI r13, 105
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
