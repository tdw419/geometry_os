; DESCRIPTION: Composite: Draws a white line from (146, 78) to (76, 134) then Renders a orange box of size 101x94 starting at (199, 17) then Sets a single blue pixel at (293, 104).
; PLAN: r0=146(x1), r1=78(y1), r2=76(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=17(y), r7=101(width), r8=94(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=293(x), r11=104(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 78
LDI r2, 76
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 17
LDI r7, 101
LDI r8, 94
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 104
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
