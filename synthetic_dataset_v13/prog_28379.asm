; DESCRIPTION: Composite: Draws a blue line from (461, 35) to (150, 111) then Creates a magenta circular shape at (360, 125) with radius 47 then Creates a white rectangular region at (316, 77) spanning 63 by 69 pixels.
; PLAN: r0=461(x1), r1=35(y1), r2=150(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=125(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x), r11=77(y), r12=63(width), r13=69(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 35
LDI r2, 150
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 125
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 77
LDI r12, 63
LDI r13, 69
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
