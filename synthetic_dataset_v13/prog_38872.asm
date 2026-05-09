; DESCRIPTION: Composite: Draws a magenta rectangle at (303, 73) with width 18 and height 20 then Places a black circle of radius 52 at center (445, 165) then Sets a single white pixel at (386, 159).
; PLAN: r0=303(x), r1=73(y), r2=18(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=165(y), r7=52(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x), r11=159(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 303
LDI r1, 73
LDI r2, 18
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 165
LDI r7, 52
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 159
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
