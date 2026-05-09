; DESCRIPTION: Composite: Draws a cyan rectangle at (116, 146) with width 74 and height 58 then Draws a red line from (289, 88) to (239, 107) then Sets a single black pixel at (296, 208).
; PLAN: r0=116(x), r1=146(y), r2=74(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x1), r6=88(y1), r7=239(x2), r8=107(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=208(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 116
LDI r1, 146
LDI r2, 74
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 88
LDI r7, 239
LDI r8, 107
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 208
LDI r12, 0x000000
PSET r10, r11, r12
HALT
