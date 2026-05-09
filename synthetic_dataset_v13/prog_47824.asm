; DESCRIPTION: Composite: Creates a yellow circular shape at (231, 125) with radius 73 then Places a green 69x85 rectangle at position (281, 143) then Renders a red line between points (437, 29) and (181, 215).
; PLAN: r0=231(x), r1=125(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=143(y), r7=69(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=437(x1), r11=29(y1), r12=181(x2), r13=215(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 125
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 143
LDI r7, 69
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 29
LDI r12, 181
LDI r13, 215
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
