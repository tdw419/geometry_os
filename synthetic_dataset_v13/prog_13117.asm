; DESCRIPTION: Composite: Draws a cyan circle centered at (147, 60) with radius 11 then Draws a white line from (270, 3) to (343, 132) then Places a black 64x44 rectangle at position (55, 100).
; PLAN: r0=147(x), r1=60(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x1), r6=3(y1), r7=343(x2), r8=132(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=100(y), r12=64(width), r13=44(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 60
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 3
LDI r7, 343
LDI r8, 132
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 100
LDI r12, 64
LDI r13, 44
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
