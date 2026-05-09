; DESCRIPTION: Composite: Sets a single orange pixel at (459, 43) then Renders a red disk with center (371, 123) and radius 64 then Places a orange 55x13 rectangle at position (342, 223).
; PLAN: r0=459(x), r1=43(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=123(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x), r11=223(y), r12=55(width), r13=13(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 43
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 371
LDI r6, 123
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 223
LDI r12, 55
LDI r13, 13
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
