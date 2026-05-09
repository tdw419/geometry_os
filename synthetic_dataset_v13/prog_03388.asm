; DESCRIPTION: Composite: Places a orange dot at position (325, 198) then Renders a white line between points (296, 175) and (205, 146) then Creates a cyan rectangular region at (64, 27) spanning 107 by 68 pixels.
; PLAN: r0=325(x), r1=198(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=296(x1), r6=175(y1), r7=205(x2), r8=146(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=64(x), r11=27(y), r12=107(width), r13=68(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 198
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 296
LDI r6, 175
LDI r7, 205
LDI r8, 146
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 64
LDI r11, 27
LDI r12, 107
LDI r13, 68
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
