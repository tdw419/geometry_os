; DESCRIPTION: Composite: Draws a magenta circle centered at (250, 121) with radius 24 then Draws a cyan line from (57, 142) to (397, 199) then Creates a white rectangular region at (219, 98) spanning 101 by 91 pixels.
; PLAN: r0=250(x), r1=121(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x1), r6=142(y1), r7=397(x2), r8=199(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=219(x), r11=98(y), r12=101(width), r13=91(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 121
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 142
LDI r7, 397
LDI r8, 199
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 98
LDI r12, 101
LDI r13, 91
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
