; DESCRIPTION: Composite: Draws a white rectangle at (129, 195) with width 46 and height 60 then Places a cyan dot at position (311, 44) then Places a yellow circle of radius 42 at center (203, 182).
; PLAN: r0=129(x), r1=195(y), r2=46(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x), r6=44(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=203(x), r11=182(y), r12=42(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 195
LDI r2, 46
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 44
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 203
LDI r11, 182
LDI r12, 42
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
