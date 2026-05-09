; DESCRIPTION: Composite: Draws a black circle centered at (305, 184) with radius 67 then Draws a white rectangle at (306, 185) with width 48 and height 39 then Draws a black line from (442, 176) to (182, 111).
; PLAN: r0=305(x), r1=184(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=185(y), r7=48(width), r8=39(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=442(x1), r11=176(y1), r12=182(x2), r13=111(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 184
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 185
LDI r7, 48
LDI r8, 39
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 176
LDI r12, 182
LDI r13, 111
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
