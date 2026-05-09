; DESCRIPTION: Composite: Draws a yellow rectangle at (152, 95) with width 47 and height 83 then Sets a single red pixel at (95, 232) then Places a cyan circle of radius 16 at center (195, 189).
; PLAN: r0=152(x), r1=95(y), r2=47(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=232(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=189(y), r12=16(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 95
LDI r2, 47
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 232
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 195
LDI r11, 189
LDI r12, 16
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
