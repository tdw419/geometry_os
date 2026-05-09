; DESCRIPTION: Composite: Places a purple 24x43 rectangle at position (121, 210) then Draws a yellow circle centered at (273, 105) with radius 49 then Places a purple dot at position (1, 119).
; PLAN: r0=121(x), r1=210(y), r2=24(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=105(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x), r11=119(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 210
LDI r2, 24
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 105
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 119
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
