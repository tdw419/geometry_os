; DESCRIPTION: Composite: Creates a purple circular shape at (380, 23) with radius 21 then Places a yellow 69x59 rectangle at position (301, 197) then Sets a single cyan pixel at (290, 248).
; PLAN: r0=380(x), r1=23(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x), r6=197(y), r7=69(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x), r11=248(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 23
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 197
LDI r7, 69
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 248
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
