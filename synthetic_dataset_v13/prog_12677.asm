; DESCRIPTION: Composite: Renders a black box of size 21x106 starting at (58, 65) then Draws a yellow circle centered at (77, 80) with radius 77.
; PLAN: r0=58(x), r1=65(y), r2=21(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=80(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 58
LDI r1, 65
LDI r2, 21
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 80
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
