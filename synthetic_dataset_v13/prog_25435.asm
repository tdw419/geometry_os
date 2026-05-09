; DESCRIPTION: Composite: Draws a cyan circle centered at (356, 177) with radius 70 then Draws a purple rectangle at (160, 110) with width 17 and height 40.
; PLAN: r0=356(x), r1=177(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=110(y), r7=17(width), r8=40(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 177
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 110
LDI r7, 17
LDI r8, 40
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
