; DESCRIPTION: Composite: Draws a white line from (365, 97) to (144, 94) then Renders a orange box of size 118x107 starting at (81, 104) then Sets a single cyan pixel at (331, 152).
; PLAN: r0=365(x1), r1=97(y1), r2=144(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=81(x), r6=104(y), r7=118(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x), r11=152(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 97
LDI r2, 144
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 104
LDI r7, 118
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 152
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
