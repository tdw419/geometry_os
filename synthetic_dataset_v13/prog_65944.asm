; DESCRIPTION: Composite: Sets a single blue pixel at (377, 195) then Draws a cyan rectangle at (234, 37) with width 86 and height 21 then Places a purple line segment connecting (173, 94) to (196, 251).
; PLAN: r0=377(x), r1=195(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=37(y), r7=86(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=173(x1), r11=94(y1), r12=196(x2), r13=251(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 195
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 234
LDI r6, 37
LDI r7, 86
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 94
LDI r12, 196
LDI r13, 251
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
