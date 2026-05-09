; DESCRIPTION: Composite: Draws a green rectangle at (224, 106) with width 107 and height 70 then Draws a green line from (440, 8) to (395, 232) then Sets a single purple pixel at (218, 185).
; PLAN: r0=224(x), r1=106(y), r2=107(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x1), r6=8(y1), r7=395(x2), r8=232(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=218(x), r11=185(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 224
LDI r1, 106
LDI r2, 107
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 8
LDI r7, 395
LDI r8, 232
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 185
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
