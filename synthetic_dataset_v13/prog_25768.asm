; DESCRIPTION: Composite: Creates a green circular shape at (395, 233) with radius 20 then Draws a orange line from (266, 79) to (91, 224) then Places a black 19x49 rectangle at position (405, 2).
; PLAN: r0=395(x), r1=233(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=266(x1), r6=79(y1), r7=91(x2), r8=224(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=2(y), r12=19(width), r13=49(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 233
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 266
LDI r6, 79
LDI r7, 91
LDI r8, 224
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 2
LDI r12, 19
LDI r13, 49
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
