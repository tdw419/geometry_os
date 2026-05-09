; DESCRIPTION: Composite: Draws a yellow line from (59, 221) to (84, 250) then Draws a green circle centered at (95, 182) with radius 74 then Draws a red rectangle at (255, 219) with width 82 and height 37.
; PLAN: r0=59(x1), r1=221(y1), r2=84(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=182(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=255(x), r11=219(y), r12=82(width), r13=37(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 221
LDI r2, 84
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 182
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 255
LDI r11, 219
LDI r12, 82
LDI r13, 37
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
