; DESCRIPTION: Composite: Creates a cyan circular shape at (184, 132) with radius 64 then Places a white line segment connecting (369, 117) to (331, 26) then Draws a white rectangle at (394, 86) with width 56 and height 53.
; PLAN: r0=184(x), r1=132(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x1), r6=117(y1), r7=331(x2), r8=26(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=86(y), r12=56(width), r13=53(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 132
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 117
LDI r7, 331
LDI r8, 26
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 86
LDI r12, 56
LDI r13, 53
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
