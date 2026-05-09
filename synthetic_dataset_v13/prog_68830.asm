; DESCRIPTION: Composite: Creates a cyan circular shape at (58, 87) with radius 46 then Draws a blue rectangle at (275, 47) with width 113 and height 63 then Renders a yellow line between points (183, 232) and (423, 26).
; PLAN: r0=58(x), r1=87(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=47(y), r7=113(width), r8=63(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=183(x1), r11=232(y1), r12=423(x2), r13=26(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 87
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 47
LDI r7, 113
LDI r8, 63
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 232
LDI r12, 423
LDI r13, 26
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
