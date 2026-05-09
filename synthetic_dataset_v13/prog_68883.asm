; DESCRIPTION: Composite: Creates a purple circular shape at (108, 119) with radius 80 then Draws a green rectangle at (63, 90) with width 97 and height 80.
; PLAN: r0=108(x), r1=119(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x), r6=90(y), r7=97(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 119
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 90
LDI r7, 97
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
