; DESCRIPTION: Composite: Draws a red rectangle at (346, 108) with width 35 and height 74 then Places a yellow dot at position (268, 186) then Creates a white circular shape at (414, 229) with radius 25.
; PLAN: r0=346(x), r1=108(y), r2=35(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=186(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=414(x), r11=229(y), r12=25(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 346
LDI r1, 108
LDI r2, 35
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 186
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 414
LDI r11, 229
LDI r12, 25
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
