; DESCRIPTION: Composite: Places a yellow line segment connecting (426, 112) to (58, 110) then Draws a cyan circle centered at (296, 29) with radius 28.
; PLAN: r0=426(x1), r1=112(y1), r2=58(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=29(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 426
LDI r1, 112
LDI r2, 58
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 29
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
