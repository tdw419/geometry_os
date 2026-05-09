; DESCRIPTION: Composite: Draws a cyan line from (31, 116) to (197, 94) then Places a orange dot at position (276, 29) then Draws a blue rectangle at (112, 138) with width 42 and height 68.
; PLAN: r0=31(x1), r1=116(y1), r2=197(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=29(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=138(y), r12=42(width), r13=68(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 116
LDI r2, 197
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 29
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 112
LDI r11, 138
LDI r12, 42
LDI r13, 68
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
