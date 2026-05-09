; DESCRIPTION: Composite: Creates a yellow rectangular region at (190, 50) spanning 111 by 74 pixels then Draws a white circle centered at (312, 161) with radius 35 then Places a blue dot at position (131, 8).
; PLAN: r0=190(x), r1=50(y), r2=111(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x), r6=161(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=131(x), r11=8(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 50
LDI r2, 111
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 161
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 131
LDI r11, 8
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
