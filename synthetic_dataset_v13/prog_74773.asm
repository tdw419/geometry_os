; DESCRIPTION: Composite: Sets a single magenta pixel at (288, 37) then Draws a white line from (278, 175) to (239, 197) then Draws a cyan rectangle at (343, 14) with width 101 and height 47.
; PLAN: r0=288(x), r1=37(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=278(x1), r6=175(y1), r7=239(x2), r8=197(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=343(x), r11=14(y), r12=101(width), r13=47(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 37
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 175
LDI r7, 239
LDI r8, 197
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 14
LDI r12, 101
LDI r13, 47
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
