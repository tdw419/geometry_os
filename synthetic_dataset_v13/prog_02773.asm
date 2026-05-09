; DESCRIPTION: Composite: Draws a black line from (245, 165) to (467, 159) then Draws a white rectangle at (239, 54) with width 80 and height 116 then Creates a blue circular shape at (294, 151) with radius 59.
; PLAN: r0=245(x1), r1=165(y1), r2=467(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=54(y), r7=80(width), r8=116(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=294(x), r11=151(y), r12=59(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 165
LDI r2, 467
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 54
LDI r7, 80
LDI r8, 116
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 151
LDI r12, 59
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
