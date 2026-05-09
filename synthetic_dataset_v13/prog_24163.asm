; DESCRIPTION: Composite: Sets a single white pixel at (384, 57) then Renders a yellow line between points (371, 84) and (457, 5) then Draws a orange rectangle at (13, 3) with width 68 and height 68.
; PLAN: r0=384(x), r1=57(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=371(x1), r6=84(y1), r7=457(x2), r8=5(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=3(y), r12=68(width), r13=68(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 57
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 84
LDI r7, 457
LDI r8, 5
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 3
LDI r12, 68
LDI r13, 68
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
