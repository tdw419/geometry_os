; DESCRIPTION: Composite: Creates a purple circular shape at (364, 24) with radius 12 then Places a black dot at position (32, 53) then Places a green 87x50 rectangle at position (266, 54).
; PLAN: r0=364(x), r1=24(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=53(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=266(x), r11=54(y), r12=87(width), r13=50(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 24
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 53
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 266
LDI r11, 54
LDI r12, 87
LDI r13, 50
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
