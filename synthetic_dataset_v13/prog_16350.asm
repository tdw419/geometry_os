; DESCRIPTION: Composite: Places a yellow circle of radius 16 at center (356, 194) then Sets a single blue pixel at (391, 88) then Places a orange 40x54 rectangle at position (469, 46).
; PLAN: r0=356(x), r1=194(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=88(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=469(x), r11=46(y), r12=40(width), r13=54(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 194
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 88
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 469
LDI r11, 46
LDI r12, 40
LDI r13, 54
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
