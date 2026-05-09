; DESCRIPTION: Composite: Creates a magenta circular shape at (180, 94) with radius 64 then Renders a orange line between points (17, 240) and (168, 143) then Draws a black rectangle at (174, 167) with width 77 and height 55.
; PLAN: r0=180(x), r1=94(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x1), r6=240(y1), r7=168(x2), r8=143(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=174(x), r11=167(y), r12=77(width), r13=55(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 94
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 240
LDI r7, 168
LDI r8, 143
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 167
LDI r12, 77
LDI r13, 55
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
