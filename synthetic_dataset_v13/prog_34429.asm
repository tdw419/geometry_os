; DESCRIPTION: Composite: Draws a orange rectangle at (275, 137) with width 65 and height 37 then Draws a red line from (511, 65) to (261, 117) then Creates a cyan circular shape at (274, 113) with radius 23.
; PLAN: r0=275(x), r1=137(y), r2=65(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x1), r6=65(y1), r7=261(x2), r8=117(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=113(y), r12=23(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 275
LDI r1, 137
LDI r2, 65
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 65
LDI r7, 261
LDI r8, 117
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 113
LDI r12, 23
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
