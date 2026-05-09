; DESCRIPTION: Composite: Draws a yellow line from (381, 83) to (230, 254) then Draws a cyan circle centered at (73, 36) with radius 12 then Places a yellow 101x110 rectangle at position (38, 113).
; PLAN: r0=381(x1), r1=83(y1), r2=230(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=36(y), r7=12(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x), r11=113(y), r12=101(width), r13=110(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 83
LDI r2, 230
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 36
LDI r7, 12
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 113
LDI r12, 101
LDI r13, 110
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
