; DESCRIPTION: Composite: Draws a cyan rectangle at (45, 198) with width 102 and height 25 then Creates a yellow circular shape at (463, 119) with radius 19.
; PLAN: r0=45(x), r1=198(y), r2=102(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x), r6=119(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 198
LDI r2, 102
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 119
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
