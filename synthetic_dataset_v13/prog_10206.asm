; DESCRIPTION: Composite: Places a orange line segment connecting (440, 229) to (320, 13) then Draws a orange rectangle at (301, 67) with width 63 and height 115 then Places a red dot at position (344, 202).
; PLAN: r0=440(x1), r1=229(y1), r2=320(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=67(y), r7=63(width), r8=115(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=344(x), r11=202(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 440
LDI r1, 229
LDI r2, 320
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 67
LDI r7, 63
LDI r8, 115
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 202
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
