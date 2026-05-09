; DESCRIPTION: Composite: Places a cyan dot at position (337, 230) then Places a magenta line segment connecting (370, 2) to (427, 105) then Draws a red rectangle at (203, 66) with width 45 and height 37.
; PLAN: r0=337(x), r1=230(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=370(x1), r6=2(y1), r7=427(x2), r8=105(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=203(x), r11=66(y), r12=45(width), r13=37(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 230
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 2
LDI r7, 427
LDI r8, 105
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 66
LDI r12, 45
LDI r13, 37
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
