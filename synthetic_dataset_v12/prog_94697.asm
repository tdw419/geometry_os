; DESCRIPTION: Composite: Renders a cyan disk with center (333, 214) and radius 22 then Creates a yellow rectangular region at (122, 109) spanning 62 by 99 pixels then Places a purple dot at position (220, 29).
; PLAN: r0=333(x), r1=214(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=109(y), r7=62(width), r8=99(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=220(x), r11=29(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 333
LDI r1, 214
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 109
LDI r7, 62
LDI r8, 99
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 29
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
