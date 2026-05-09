; DESCRIPTION: Composite: Draws a cyan circle centered at (336, 178) with radius 42 then Places a orange line segment connecting (394, 31) to (454, 205) then Places a blue 30x94 rectangle at position (216, 58).
; PLAN: r0=336(x), r1=178(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x1), r6=31(y1), r7=454(x2), r8=205(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=58(y), r12=30(width), r13=94(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 178
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 31
LDI r7, 454
LDI r8, 205
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 58
LDI r12, 30
LDI r13, 94
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
