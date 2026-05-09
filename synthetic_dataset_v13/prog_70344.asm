; DESCRIPTION: Composite: Draws a yellow circle centered at (228, 203) with radius 35 then Draws a orange line from (38, 236) to (314, 26) then Places a cyan 112x44 rectangle at position (241, 77).
; PLAN: r0=228(x), r1=203(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x1), r6=236(y1), r7=314(x2), r8=26(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=241(x), r11=77(y), r12=112(width), r13=44(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 203
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 236
LDI r7, 314
LDI r8, 26
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 77
LDI r12, 112
LDI r13, 44
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
