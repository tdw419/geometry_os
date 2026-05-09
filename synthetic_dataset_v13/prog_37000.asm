; DESCRIPTION: Composite: Places a yellow 84x39 rectangle at position (174, 150) then Sets a single green pixel at (141, 106) then Places a cyan circle of radius 23 at center (431, 139).
; PLAN: r0=174(x), r1=150(y), r2=84(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=106(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=139(y), r12=23(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 150
LDI r2, 84
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 106
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 431
LDI r11, 139
LDI r12, 23
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
