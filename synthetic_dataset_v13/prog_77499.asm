; DESCRIPTION: Composite: Places a purple line segment connecting (57, 254) to (223, 252) then Draws a cyan circle centered at (367, 64) with radius 57 then Places a white 44x104 rectangle at position (347, 37).
; PLAN: r0=57(x1), r1=254(y1), r2=223(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=64(y), r7=57(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=347(x), r11=37(y), r12=44(width), r13=104(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 254
LDI r2, 223
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 64
LDI r7, 57
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 347
LDI r11, 37
LDI r12, 44
LDI r13, 104
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
