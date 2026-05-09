; DESCRIPTION: Composite: Places a yellow 30x62 rectangle at position (482, 73) then Renders a orange line between points (304, 215) and (74, 17) then Places a orange circle of radius 28 at center (137, 42).
; PLAN: r0=482(x), r1=73(y), r2=30(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x1), r6=215(y1), r7=74(x2), r8=17(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=42(y), r12=28(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 73
LDI r2, 30
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 215
LDI r7, 74
LDI r8, 17
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 42
LDI r12, 28
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
