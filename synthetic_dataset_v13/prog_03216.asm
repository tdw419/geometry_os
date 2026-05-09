; DESCRIPTION: Composite: Draws a cyan rectangle at (199, 39) with width 99 and height 97 then Draws a green line from (402, 84) to (134, 57) then Places a orange dot at position (208, 207).
; PLAN: r0=199(x), r1=39(y), r2=99(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x1), r6=84(y1), r7=134(x2), r8=57(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=208(x), r11=207(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 39
LDI r2, 99
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 84
LDI r7, 134
LDI r8, 57
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 207
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
