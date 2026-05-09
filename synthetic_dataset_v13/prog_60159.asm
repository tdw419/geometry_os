; DESCRIPTION: Composite: Draws a cyan rectangle at (100, 92) with width 73 and height 110 then Places a green line segment connecting (176, 143) to (224, 198) then Places a yellow dot at position (1, 50).
; PLAN: r0=100(x), r1=92(y), r2=73(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x1), r6=143(y1), r7=224(x2), r8=198(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=1(x), r11=50(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 92
LDI r2, 73
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 143
LDI r7, 224
LDI r8, 198
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 1
LDI r11, 50
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
