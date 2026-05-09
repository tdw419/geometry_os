; DESCRIPTION: Composite: Places a white dot at position (396, 94) then Draws a white rectangle at (70, 111) with width 106 and height 96 then Places a green line segment connecting (67, 107) to (323, 33).
; PLAN: r0=396(x), r1=94(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=70(x), r6=111(y), r7=106(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=67(x1), r11=107(y1), r12=323(x2), r13=33(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 94
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 70
LDI r6, 111
LDI r7, 106
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 107
LDI r12, 323
LDI r13, 33
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
