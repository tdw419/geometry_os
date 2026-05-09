; DESCRIPTION: Composite: Places a cyan circle of radius 56 at center (434, 102) then Draws a red rectangle at (91, 40) with width 12 and height 46 then Places a purple dot at position (66, 254).
; PLAN: r0=434(x), r1=102(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=91(x), r6=40(y), r7=12(width), r8=46(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=66(x), r11=254(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 434
LDI r1, 102
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 91
LDI r6, 40
LDI r7, 12
LDI r8, 46
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 254
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
