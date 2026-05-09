; DESCRIPTION: Composite: Draws a magenta rectangle at (364, 96) with width 91 and height 96 then Sets a single white pixel at (14, 231) then Renders a magenta line between points (439, 34) and (505, 38).
; PLAN: r0=364(x), r1=96(y), r2=91(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x), r6=231(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=439(x1), r11=34(y1), r12=505(x2), r13=38(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 96
LDI r2, 91
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 231
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 439
LDI r11, 34
LDI r12, 505
LDI r13, 38
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
