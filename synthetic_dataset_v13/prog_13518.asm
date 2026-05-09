; DESCRIPTION: Composite: Places a green dot at position (374, 172) then Draws a magenta rectangle at (297, 27) with width 14 and height 54 then Draws a purple line from (426, 117) to (265, 198).
; PLAN: r0=374(x), r1=172(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=27(y), r7=14(width), r8=54(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x1), r11=117(y1), r12=265(x2), r13=198(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 172
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 297
LDI r6, 27
LDI r7, 14
LDI r8, 54
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 117
LDI r12, 265
LDI r13, 198
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
