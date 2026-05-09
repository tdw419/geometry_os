; DESCRIPTION: Composite: Sets a single yellow pixel at (465, 216) then Draws a red circle centered at (350, 193) with radius 41 then Renders a black box of size 70x35 starting at (257, 51).
; PLAN: r0=465(x), r1=216(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=193(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=257(x), r11=51(y), r12=70(width), r13=35(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 216
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 350
LDI r6, 193
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 257
LDI r11, 51
LDI r12, 70
LDI r13, 35
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
