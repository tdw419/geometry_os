; DESCRIPTION: Composite: Places a orange dot at position (438, 221) then Draws a white line from (279, 90) to (122, 206) then Draws a blue rectangle at (304, 65) with width 79 and height 64.
; PLAN: r0=438(x), r1=221(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=279(x1), r6=90(y1), r7=122(x2), r8=206(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=304(x), r11=65(y), r12=79(width), r13=64(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 221
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 279
LDI r6, 90
LDI r7, 122
LDI r8, 206
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 65
LDI r12, 79
LDI r13, 64
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
