; DESCRIPTION: Composite: Draws a red rectangle at (406, 35) with width 74 and height 12 then Creates a purple circular shape at (295, 144) with radius 70.
; PLAN: r0=406(x), r1=35(y), r2=74(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x), r6=144(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 35
LDI r2, 74
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 144
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
