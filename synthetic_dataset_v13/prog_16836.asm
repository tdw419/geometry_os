; DESCRIPTION: Composite: Sets a single cyan pixel at (438, 157) then Draws a orange rectangle at (124, 78) with width 42 and height 44 then Draws a white line from (249, 36) to (250, 106).
; PLAN: r0=438(x), r1=157(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=78(y), r7=42(width), r8=44(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=249(x1), r11=36(y1), r12=250(x2), r13=106(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 157
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 78
LDI r7, 42
LDI r8, 44
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 36
LDI r12, 250
LDI r13, 106
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
