; DESCRIPTION: Composite: Draws a white line from (373, 248) to (344, 5) then Places a cyan 106x84 rectangle at position (333, 95) then Draws a magenta circle centered at (353, 39) with radius 10.
; PLAN: r0=373(x1), r1=248(y1), r2=344(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=95(y), r7=106(width), r8=84(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=353(x), r11=39(y), r12=10(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 248
LDI r2, 344
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 95
LDI r7, 106
LDI r8, 84
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 39
LDI r12, 10
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
