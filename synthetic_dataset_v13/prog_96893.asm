; DESCRIPTION: Composite: Places a cyan 11x54 rectangle at position (235, 22) then Draws a white circle centered at (194, 91) with radius 64 then Renders a red line between points (12, 4) and (239, 145).
; PLAN: r0=235(x), r1=22(y), r2=11(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=91(y), r7=64(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=12(x1), r11=4(y1), r12=239(x2), r13=145(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 22
LDI r2, 11
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 91
LDI r7, 64
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 12
LDI r11, 4
LDI r12, 239
LDI r13, 145
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
