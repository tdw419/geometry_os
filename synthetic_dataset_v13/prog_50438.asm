; DESCRIPTION: Composite: Draws a yellow rectangle at (387, 190) with width 62 and height 36 then Draws a red circle centered at (125, 82) with radius 26 then Places a magenta line segment connecting (134, 224) to (276, 213).
; PLAN: r0=387(x), r1=190(y), r2=62(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=82(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=134(x1), r11=224(y1), r12=276(x2), r13=213(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 190
LDI r2, 62
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 82
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 134
LDI r11, 224
LDI r12, 276
LDI r13, 213
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
