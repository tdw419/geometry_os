; DESCRIPTION: Composite: Creates a green circular shape at (268, 75) with radius 57 then Draws a green line from (492, 77) to (248, 108) then Draws a blue rectangle at (53, 75) with width 66 and height 71.
; PLAN: r0=268(x), r1=75(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=492(x1), r6=77(y1), r7=248(x2), r8=108(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=53(x), r11=75(y), r12=66(width), r13=71(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 75
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 492
LDI r6, 77
LDI r7, 248
LDI r8, 108
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 75
LDI r12, 66
LDI r13, 71
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
