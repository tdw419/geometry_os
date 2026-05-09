; DESCRIPTION: Composite: Sets a single black pixel at (238, 39) then Draws a black line from (267, 232) to (176, 250) then Draws a black rectangle at (293, 65) with width 98 and height 92.
; PLAN: r0=238(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=267(x1), r6=232(y1), r7=176(x2), r8=250(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=65(y), r12=98(width), r13=92(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 238
LDI r1, 39
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 267
LDI r6, 232
LDI r7, 176
LDI r8, 250
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 65
LDI r12, 98
LDI r13, 92
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
