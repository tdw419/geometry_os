; DESCRIPTION: Composite: Places a green line segment connecting (111, 85) to (440, 165) then Draws a yellow circle centered at (197, 141) with radius 55.
; PLAN: r0=111(x1), r1=85(y1), r2=440(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=141(y), r7=55(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 85
LDI r2, 440
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 141
LDI r7, 55
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
