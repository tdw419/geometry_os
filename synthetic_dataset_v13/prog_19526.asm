; DESCRIPTION: Composite: Draws a magenta circle centered at (63, 171) with radius 62 then Draws a orange line from (479, 28) to (261, 76) then Draws a magenta rectangle at (246, 70) with width 57 and height 52.
; PLAN: r0=63(x), r1=171(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x1), r6=28(y1), r7=261(x2), r8=76(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=246(x), r11=70(y), r12=57(width), r13=52(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 171
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 28
LDI r7, 261
LDI r8, 76
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 70
LDI r12, 57
LDI r13, 52
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
