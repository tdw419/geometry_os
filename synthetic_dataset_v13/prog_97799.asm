; DESCRIPTION: Composite: Renders a yellow box of size 107x106 starting at (117, 125) then Places a cyan circle of radius 72 at center (210, 156) then Places a purple dot at position (354, 78).
; PLAN: r0=117(x), r1=125(y), r2=107(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=156(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x), r11=78(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 117
LDI r1, 125
LDI r2, 107
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 156
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 78
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
