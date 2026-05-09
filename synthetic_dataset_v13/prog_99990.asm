; DESCRIPTION: Composite: Draws a green rectangle at (222, 93) with width 100 and height 37 then Places a cyan line segment connecting (94, 249) to (126, 161) then Sets a single purple pixel at (364, 20).
; PLAN: r0=222(x), r1=93(y), r2=100(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x1), r6=249(y1), r7=126(x2), r8=161(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=364(x), r11=20(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 93
LDI r2, 100
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 249
LDI r7, 126
LDI r8, 161
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 20
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
