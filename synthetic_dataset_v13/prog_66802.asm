; DESCRIPTION: Composite: Places a red circle of radius 62 at center (312, 64) then Sets a single cyan pixel at (269, 14) then Renders a purple box of size 12x17 starting at (418, 233).
; PLAN: r0=312(x), r1=64(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=14(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=418(x), r11=233(y), r12=12(width), r13=17(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 64
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 14
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 418
LDI r11, 233
LDI r12, 12
LDI r13, 17
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
