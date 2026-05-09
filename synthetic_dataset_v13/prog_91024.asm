; DESCRIPTION: Composite: Places a black 53x52 rectangle at position (11, 127) then Places a white line segment connecting (87, 44) to (181, 39) then Creates a magenta circular shape at (291, 151) with radius 11.
; PLAN: r0=11(x), r1=127(y), r2=53(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=44(y1), r7=181(x2), r8=39(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=291(x), r11=151(y), r12=11(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 11
LDI r1, 127
LDI r2, 53
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 44
LDI r7, 181
LDI r8, 39
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 151
LDI r12, 11
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
