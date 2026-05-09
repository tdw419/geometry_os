; DESCRIPTION: Composite: Draws a yellow line from (107, 22) to (311, 205) then Draws a green circle centered at (372, 116) with radius 76.
; PLAN: r0=107(x1), r1=22(y1), r2=311(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=116(y), r7=76(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 107
LDI r1, 22
LDI r2, 311
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 116
LDI r7, 76
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
