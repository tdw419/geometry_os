; DESCRIPTION: Composite: Draws a cyan circle centered at (222, 128) with radius 38 then Draws a green line from (39, 63) to (501, 113) then Places a red 55x38 rectangle at position (329, 110).
; PLAN: r0=222(x), r1=128(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x1), r6=63(y1), r7=501(x2), r8=113(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=110(y), r12=55(width), r13=38(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 128
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 63
LDI r7, 501
LDI r8, 113
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 110
LDI r12, 55
LDI r13, 38
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
