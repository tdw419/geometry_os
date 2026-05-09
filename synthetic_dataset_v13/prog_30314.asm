; DESCRIPTION: Composite: Renders a black disk with center (236, 211) and radius 28 then Places a magenta 23x75 rectangle at position (233, 143) then Draws a red line from (199, 51) to (366, 73).
; PLAN: r0=236(x), r1=211(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x), r6=143(y), r7=23(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x1), r11=51(y1), r12=366(x2), r13=73(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 211
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 143
LDI r7, 23
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 51
LDI r12, 366
LDI r13, 73
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
