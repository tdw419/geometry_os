; DESCRIPTION: Composite: Draws a orange rectangle at (93, 160) with width 55 and height 89 then Draws a yellow line from (9, 36) to (214, 39) then Places a orange circle of radius 71 at center (328, 156).
; PLAN: r0=93(x), r1=160(y), r2=55(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x1), r6=36(y1), r7=214(x2), r8=39(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=328(x), r11=156(y), r12=71(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 160
LDI r2, 55
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 36
LDI r7, 214
LDI r8, 39
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 156
LDI r12, 71
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
