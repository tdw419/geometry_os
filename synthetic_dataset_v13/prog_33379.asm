; DESCRIPTION: Composite: Creates a magenta circular shape at (211, 157) with radius 19 then Draws a blue rectangle at (272, 170) with width 75 and height 46 then Draws a white line from (384, 141) to (403, 55).
; PLAN: r0=211(x), r1=157(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=170(y), r7=75(width), r8=46(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=384(x1), r11=141(y1), r12=403(x2), r13=55(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 157
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 170
LDI r7, 75
LDI r8, 46
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 141
LDI r12, 403
LDI r13, 55
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
