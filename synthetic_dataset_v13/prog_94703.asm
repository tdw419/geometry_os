; DESCRIPTION: Composite: Sets a single white pixel at (121, 75) then Draws a red rectangle at (386, 72) with width 43 and height 98 then Draws a magenta circle centered at (279, 94) with radius 50.
; PLAN: r0=121(x), r1=75(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=72(y), r7=43(width), r8=98(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=279(x), r11=94(y), r12=50(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 75
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 386
LDI r6, 72
LDI r7, 43
LDI r8, 98
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 94
LDI r12, 50
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
