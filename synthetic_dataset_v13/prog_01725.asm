; DESCRIPTION: Composite: Places a yellow 34x54 rectangle at position (382, 198) then Renders a orange disk with center (263, 107) and radius 62 then Sets a single white pixel at (258, 101).
; PLAN: r0=382(x), r1=198(y), r2=34(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=107(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x), r11=101(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 198
LDI r2, 34
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 107
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 101
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
