; DESCRIPTION: Composite: Draws a yellow rectangle at (181, 2) with width 36 and height 114 then Renders a magenta disk with center (174, 82) and radius 16 then Draws a black line from (420, 127) to (497, 223).
; PLAN: r0=181(x), r1=2(y), r2=36(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=82(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=420(x1), r11=127(y1), r12=497(x2), r13=223(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 2
LDI r2, 36
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 82
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 420
LDI r11, 127
LDI r12, 497
LDI r13, 223
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
