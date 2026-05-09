; DESCRIPTION: Composite: Draws a black circle centered at (445, 45) with radius 30 then Places a purple dot at position (291, 129) then Places a purple 61x74 rectangle at position (115, 76).
; PLAN: r0=445(x), r1=45(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=129(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=76(y), r12=61(width), r13=74(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 45
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 129
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 115
LDI r11, 76
LDI r12, 61
LDI r13, 74
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
