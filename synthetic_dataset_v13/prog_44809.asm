; DESCRIPTION: Composite: Draws a white circle centered at (133, 151) with radius 70 then Places a black 66x97 rectangle at position (24, 97) then Draws a red line from (304, 12) to (474, 40).
; PLAN: r0=133(x), r1=151(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=97(y), r7=66(width), r8=97(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x1), r11=12(y1), r12=474(x2), r13=40(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 151
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 97
LDI r7, 66
LDI r8, 97
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 12
LDI r12, 474
LDI r13, 40
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
