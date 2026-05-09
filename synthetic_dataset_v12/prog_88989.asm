; DESCRIPTION: Composite: Places a red circle of radius 51 at center (142, 56) then Draws a red line from (328, 112) to (381, 84) then Places a green 25x42 rectangle at position (357, 54).
; PLAN: r0=142(x), r1=56(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x1), r6=112(y1), r7=381(x2), r8=84(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=54(y), r12=25(width), r13=42(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 56
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 112
LDI r7, 381
LDI r8, 84
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 54
LDI r12, 25
LDI r13, 42
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
