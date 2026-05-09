; DESCRIPTION: Composite: Places a orange 98x106 rectangle at position (258, 86) then Places a blue dot at position (21, 148) then Places a cyan circle of radius 46 at center (319, 191).
; PLAN: r0=258(x), r1=86(y), r2=98(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x), r6=148(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=319(x), r11=191(y), r12=46(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 86
LDI r2, 98
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 148
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 319
LDI r11, 191
LDI r12, 46
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
