; DESCRIPTION: Composite: Renders a orange line between points (381, 42) and (122, 175) then Draws a green rectangle at (330, 167) with width 111 and height 50 then Sets a single cyan pixel at (392, 210).
; PLAN: r0=381(x1), r1=42(y1), r2=122(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=167(y), r7=111(width), r8=50(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=392(x), r11=210(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 42
LDI r2, 122
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 167
LDI r7, 111
LDI r8, 50
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 210
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
