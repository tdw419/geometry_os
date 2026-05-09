; DESCRIPTION: Composite: Sets a single black pixel at (275, 236) then Draws a cyan rectangle at (232, 91) with width 17 and height 57 then Draws a cyan line from (122, 226) to (89, 136).
; PLAN: r0=275(x), r1=236(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=232(x), r6=91(y), r7=17(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x1), r11=226(y1), r12=89(x2), r13=136(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 236
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 232
LDI r6, 91
LDI r7, 17
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 226
LDI r12, 89
LDI r13, 136
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
