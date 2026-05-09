; DESCRIPTION: Composite: Creates a orange circular shape at (131, 68) with radius 35 then Places a blue 71x106 rectangle at position (85, 33) then Places a red dot at position (226, 128).
; PLAN: r0=131(x), r1=68(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=33(y), r7=71(width), r8=106(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x), r11=128(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 131
LDI r1, 68
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 33
LDI r7, 71
LDI r8, 106
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 128
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
