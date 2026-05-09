; DESCRIPTION: Composite: Draws a green rectangle at (340, 83) with width 70 and height 28 then Places a yellow line segment connecting (418, 52) to (429, 55) then Sets a single orange pixel at (4, 150).
; PLAN: r0=340(x), r1=83(y), r2=70(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x1), r6=52(y1), r7=429(x2), r8=55(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=4(x), r11=150(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 83
LDI r2, 70
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 52
LDI r7, 429
LDI r8, 55
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 150
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
