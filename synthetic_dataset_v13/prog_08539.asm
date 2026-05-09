; DESCRIPTION: Composite: Places a green line segment connecting (298, 102) to (477, 12) then Sets a single purple pixel at (11, 141) then Draws a magenta circle centered at (311, 111) with radius 65.
; PLAN: r0=298(x1), r1=102(y1), r2=477(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=11(x), r6=141(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=311(x), r11=111(y), r12=65(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 102
LDI r2, 477
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 141
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 311
LDI r11, 111
LDI r12, 65
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
