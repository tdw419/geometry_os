; DESCRIPTION: Composite: Places a orange dot at position (336, 243) then Draws a yellow rectangle at (441, 90) with width 70 and height 88 then Draws a yellow line from (377, 17) to (157, 157).
; PLAN: r0=336(x), r1=243(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=90(y), r7=70(width), r8=88(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=377(x1), r11=17(y1), r12=157(x2), r13=157(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 243
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 441
LDI r6, 90
LDI r7, 70
LDI r8, 88
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 17
LDI r12, 157
LDI r13, 157
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
