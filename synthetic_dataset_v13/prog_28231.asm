; DESCRIPTION: Composite: Draws a purple rectangle at (11, 39) with width 75 and height 87 then Places a cyan circle of radius 12 at center (374, 216) then Places a white line segment connecting (479, 11) to (222, 79).
; PLAN: r0=11(x), r1=39(y), r2=75(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=216(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=479(x1), r11=11(y1), r12=222(x2), r13=79(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 39
LDI r2, 75
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 216
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 479
LDI r11, 11
LDI r12, 222
LDI r13, 79
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
