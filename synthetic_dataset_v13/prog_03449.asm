; DESCRIPTION: Composite: Places a purple line segment connecting (504, 104) to (331, 37) then Draws a green circle centered at (314, 233) with radius 23 then Places a white 94x28 rectangle at position (377, 142).
; PLAN: r0=504(x1), r1=104(y1), r2=331(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=233(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x), r11=142(y), r12=94(width), r13=28(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 504
LDI r1, 104
LDI r2, 331
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 233
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 142
LDI r12, 94
LDI r13, 28
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
