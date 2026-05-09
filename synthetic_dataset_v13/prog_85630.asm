; DESCRIPTION: Composite: Places a cyan circle of radius 45 at center (319, 96) then Places a orange 52x60 rectangle at position (123, 142) then Sets a single red pixel at (108, 18).
; PLAN: r0=319(x), r1=96(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x), r6=142(y), r7=52(width), r8=60(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=18(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 319
LDI r1, 96
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 142
LDI r7, 52
LDI r8, 60
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 18
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
