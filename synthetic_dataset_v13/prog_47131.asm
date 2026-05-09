; DESCRIPTION: Composite: Sets a single purple pixel at (498, 94) then Draws a yellow line from (231, 104) to (344, 208) then Places a cyan 84x54 rectangle at position (337, 188).
; PLAN: r0=498(x), r1=94(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=231(x1), r6=104(y1), r7=344(x2), r8=208(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=337(x), r11=188(y), r12=84(width), r13=54(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 498
LDI r1, 94
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 231
LDI r6, 104
LDI r7, 344
LDI r8, 208
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 188
LDI r12, 84
LDI r13, 54
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
