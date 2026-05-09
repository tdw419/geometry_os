; DESCRIPTION: Composite: Sets a single green pixel at (38, 188) then Renders a black box of size 45x18 starting at (15, 172) then Draws a white circle centered at (213, 134) with radius 61.
; PLAN: r0=38(x), r1=188(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=15(x), r6=172(y), r7=45(width), r8=18(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=134(y), r12=61(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 38
LDI r1, 188
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 15
LDI r6, 172
LDI r7, 45
LDI r8, 18
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 134
LDI r12, 61
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
