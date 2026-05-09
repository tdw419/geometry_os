; DESCRIPTION: Composite: Creates a white rectangular region at (345, 97) spanning 76 by 32 pixels then Places a blue circle of radius 77 at center (384, 110) then Draws a white line from (172, 180) to (113, 77).
; PLAN: r0=345(x), r1=97(y), r2=76(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=384(x), r6=110(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x1), r11=180(y1), r12=113(x2), r13=77(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 97
LDI r2, 76
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 110
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 180
LDI r12, 113
LDI r13, 77
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
