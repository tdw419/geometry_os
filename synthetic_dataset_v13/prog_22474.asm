; DESCRIPTION: Composite: Places a white line segment connecting (43, 148) to (16, 75) then Draws a orange rectangle at (341, 185) with width 86 and height 64 then Places a yellow dot at position (12, 146).
; PLAN: r0=43(x1), r1=148(y1), r2=16(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=185(y), r7=86(width), r8=64(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=12(x), r11=146(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 43
LDI r1, 148
LDI r2, 16
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 185
LDI r7, 86
LDI r8, 64
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 146
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
