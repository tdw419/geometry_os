; DESCRIPTION: Composite: Places a green circle of radius 52 at center (394, 185) then Draws a white rectangle at (376, 77) with width 115 and height 89 then Places a white line segment connecting (47, 237) to (249, 115).
; PLAN: r0=394(x), r1=185(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=77(y), r7=115(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x1), r11=237(y1), r12=249(x2), r13=115(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 185
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 77
LDI r7, 115
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 237
LDI r12, 249
LDI r13, 115
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
