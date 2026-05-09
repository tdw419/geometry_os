; DESCRIPTION: Composite: Places a yellow 71x50 rectangle at position (389, 134) then Renders a black disk with center (60, 149) and radius 34 then Sets a single yellow pixel at (195, 248).
; PLAN: r0=389(x), r1=134(y), r2=71(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=149(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=248(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 134
LDI r2, 71
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 149
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 248
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
