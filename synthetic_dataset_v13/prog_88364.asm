; DESCRIPTION: Composite: Draws a green rectangle at (21, 124) with width 52 and height 41 then Creates a magenta circular shape at (448, 225) with radius 16.
; PLAN: r0=21(x), r1=124(y), r2=52(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x), r6=225(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 124
LDI r2, 52
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 225
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
