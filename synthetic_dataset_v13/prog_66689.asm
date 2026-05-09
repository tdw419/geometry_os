; DESCRIPTION: Composite: Renders a orange disk with center (326, 101) and radius 76 then Places a cyan 69x111 rectangle at position (376, 70) then Sets a single red pixel at (100, 35).
; PLAN: r0=326(x), r1=101(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=70(y), r7=69(width), r8=111(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x), r11=35(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 101
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 70
LDI r7, 69
LDI r8, 111
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 35
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
