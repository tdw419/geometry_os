; DESCRIPTION: Composite: Draws a black rectangle at (312, 166) with width 53 and height 71 then Draws a blue line from (249, 212) to (380, 141) then Sets a single black pixel at (98, 2).
; PLAN: r0=312(x), r1=166(y), r2=53(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x1), r6=212(y1), r7=380(x2), r8=141(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=2(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 166
LDI r2, 53
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 212
LDI r7, 380
LDI r8, 141
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 2
LDI r12, 0x000000
PSET r10, r11, r12
HALT
