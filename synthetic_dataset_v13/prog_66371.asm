; DESCRIPTION: Composite: Renders a black box of size 94x49 starting at (64, 26) then Sets a single cyan pixel at (297, 220) then Draws a purple circle centered at (63, 135) with radius 41.
; PLAN: r0=64(x), r1=26(y), r2=94(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=220(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=63(x), r11=135(y), r12=41(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 64
LDI r1, 26
LDI r2, 94
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 220
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 63
LDI r11, 135
LDI r12, 41
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
