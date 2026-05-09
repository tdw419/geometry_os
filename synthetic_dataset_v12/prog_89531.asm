; DESCRIPTION: Composite: Places a red 26x98 rectangle at position (211, 143) then Draws a black line from (161, 56) to (64, 141) then Places a cyan circle of radius 65 at center (304, 106).
; PLAN: r0=211(x), r1=143(y), r2=26(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x1), r6=56(y1), r7=64(x2), r8=141(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=304(x), r11=106(y), r12=65(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 143
LDI r2, 26
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 56
LDI r7, 64
LDI r8, 141
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 106
LDI r12, 65
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
