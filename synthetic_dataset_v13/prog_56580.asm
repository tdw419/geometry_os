; DESCRIPTION: Composite: Places a black circle of radius 21 at center (199, 171) then Places a cyan 104x43 rectangle at position (320, 93) then Draws a orange line from (21, 122) to (284, 185).
; PLAN: r0=199(x), r1=171(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=93(y), r7=104(width), r8=43(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=21(x1), r11=122(y1), r12=284(x2), r13=185(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 171
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 93
LDI r7, 104
LDI r8, 43
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 122
LDI r12, 284
LDI r13, 185
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
