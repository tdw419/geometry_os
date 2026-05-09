; DESCRIPTION: Composite: Places a orange dot at position (493, 223) then Draws a purple rectangle at (310, 7) with width 78 and height 52 then Draws a yellow line from (385, 85) to (189, 15).
; PLAN: r0=493(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=310(x), r6=7(y), r7=78(width), r8=52(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x1), r11=85(y1), r12=189(x2), r13=15(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 223
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 310
LDI r6, 7
LDI r7, 78
LDI r8, 52
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 85
LDI r12, 189
LDI r13, 15
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
