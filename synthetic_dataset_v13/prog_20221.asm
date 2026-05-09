; DESCRIPTION: Composite: Draws a magenta rectangle at (31, 44) with width 103 and height 21 then Sets a single red pixel at (459, 46) then Places a yellow line segment connecting (304, 167) to (340, 16).
; PLAN: r0=31(x), r1=44(y), r2=103(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=46(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=304(x1), r11=167(y1), r12=340(x2), r13=16(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 44
LDI r2, 103
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 46
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 304
LDI r11, 167
LDI r12, 340
LDI r13, 16
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
