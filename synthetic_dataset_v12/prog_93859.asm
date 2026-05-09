; DESCRIPTION: Composite: Renders a purple box of size 72x14 starting at (182, 185) then Places a magenta circle of radius 29 at center (410, 88) then Places a orange dot at position (125, 123).
; PLAN: r0=182(x), r1=185(y), r2=72(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=88(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=125(x), r11=123(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 185
LDI r2, 72
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 88
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 125
LDI r11, 123
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
