; DESCRIPTION: Composite: Draws a orange rectangle at (272, 28) with width 86 and height 96 then Sets a single white pixel at (106, 115) then Places a green line segment connecting (134, 151) to (274, 254).
; PLAN: r0=272(x), r1=28(y), r2=86(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=115(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=134(x1), r11=151(y1), r12=274(x2), r13=254(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 28
LDI r2, 86
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 115
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 134
LDI r11, 151
LDI r12, 274
LDI r13, 254
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
