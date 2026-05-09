; DESCRIPTION: Composite: Places a yellow line segment connecting (494, 231) to (213, 31) then Creates a black circular shape at (98, 119) with radius 29.
; PLAN: r0=494(x1), r1=231(y1), r2=213(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=119(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 494
LDI r1, 231
LDI r2, 213
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 119
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
