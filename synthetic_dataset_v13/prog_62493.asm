; DESCRIPTION: Composite: Creates a red circular shape at (376, 132) with radius 34 then Draws a green line from (238, 55) to (313, 243) then Draws a yellow rectangle at (128, 83) with width 54 and height 43.
; PLAN: r0=376(x), r1=132(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x1), r6=55(y1), r7=313(x2), r8=243(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=128(x), r11=83(y), r12=54(width), r13=43(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 132
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 55
LDI r7, 313
LDI r8, 243
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 83
LDI r12, 54
LDI r13, 43
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
