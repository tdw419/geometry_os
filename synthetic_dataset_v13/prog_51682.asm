; DESCRIPTION: Composite: Renders a white box of size 80x97 starting at (146, 104) then Draws a black circle centered at (261, 191) with radius 54.
; PLAN: r0=146(x), r1=104(y), r2=80(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=191(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 146
LDI r1, 104
LDI r2, 80
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 191
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
