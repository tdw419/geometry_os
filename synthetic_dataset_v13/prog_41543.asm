; DESCRIPTION: Composite: Places a magenta line segment connecting (473, 139) to (309, 229) then Draws a white rectangle at (97, 118) with width 113 and height 36 then Places a black dot at position (300, 178).
; PLAN: r0=473(x1), r1=139(y1), r2=309(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=118(y), r7=113(width), r8=36(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x), r11=178(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 473
LDI r1, 139
LDI r2, 309
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 118
LDI r7, 113
LDI r8, 36
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 178
LDI r12, 0x000000
PSET r10, r11, r12
HALT
