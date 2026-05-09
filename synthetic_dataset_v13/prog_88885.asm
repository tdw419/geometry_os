; DESCRIPTION: Composite: Places a black dot at position (275, 102) then Draws a black rectangle at (447, 191) with width 59 and height 41 then Places a yellow line segment connecting (86, 143) to (121, 90).
; PLAN: r0=275(x), r1=102(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=191(y), r7=59(width), r8=41(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x1), r11=143(y1), r12=121(x2), r13=90(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 102
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 447
LDI r6, 191
LDI r7, 59
LDI r8, 41
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 143
LDI r12, 121
LDI r13, 90
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
