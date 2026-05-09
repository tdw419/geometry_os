; DESCRIPTION: Composite: Draws a purple rectangle at (272, 146) with width 97 and height 88 then Creates a green circular shape at (277, 126) with radius 17.
; PLAN: r0=272(x), r1=146(y), r2=97(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=126(y), r7=17(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 272
LDI r1, 146
LDI r2, 97
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 126
LDI r7, 17
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
