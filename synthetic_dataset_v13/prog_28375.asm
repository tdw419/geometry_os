; DESCRIPTION: Composite: Places a black line segment connecting (202, 26) to (497, 154) then Draws a yellow circle centered at (281, 80) with radius 66.
; PLAN: r0=202(x1), r1=26(y1), r2=497(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=80(y), r7=66(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 202
LDI r1, 26
LDI r2, 497
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 80
LDI r7, 66
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
