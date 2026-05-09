; DESCRIPTION: Composite: Renders a black box of size 103x59 starting at (219, 182) then Sets a single cyan pixel at (279, 1) then Places a purple circle of radius 73 at center (302, 158).
; PLAN: r0=219(x), r1=182(y), r2=103(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x), r6=1(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=302(x), r11=158(y), r12=73(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 219
LDI r1, 182
LDI r2, 103
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 1
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 302
LDI r11, 158
LDI r12, 73
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
