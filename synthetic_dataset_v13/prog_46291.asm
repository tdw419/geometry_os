; DESCRIPTION: Composite: Draws a white circle centered at (258, 94) with radius 75 then Renders a yellow box of size 10x111 starting at (456, 9) then Sets a single white pixel at (468, 10).
; PLAN: r0=258(x), r1=94(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=9(y), r7=10(width), r8=111(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=468(x), r11=10(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 258
LDI r1, 94
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 9
LDI r7, 10
LDI r8, 111
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 468
LDI r11, 10
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
