; DESCRIPTION: Composite: Draws a orange circle centered at (394, 159) with radius 33 then Places a yellow dot at position (243, 208) then Draws a green rectangle at (2, 196) with width 65 and height 19.
; PLAN: r0=394(x), r1=159(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=208(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=2(x), r11=196(y), r12=65(width), r13=19(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 159
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 208
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 2
LDI r11, 196
LDI r12, 65
LDI r13, 19
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
