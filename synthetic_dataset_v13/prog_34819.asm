; DESCRIPTION: Composite: Draws a white circle centered at (113, 93) with radius 67 then Places a orange 112x80 rectangle at position (304, 81) then Draws a yellow line from (333, 81) to (230, 106).
; PLAN: r0=113(x), r1=93(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x), r6=81(y), r7=112(width), r8=80(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=333(x1), r11=81(y1), r12=230(x2), r13=106(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 93
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 81
LDI r7, 112
LDI r8, 80
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 81
LDI r12, 230
LDI r13, 106
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
