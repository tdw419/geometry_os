; DESCRIPTION: Composite: Places a yellow dot at position (363, 5) then Draws a orange rectangle at (291, 156) with width 47 and height 58 then Places a white line segment connecting (143, 107) to (402, 38).
; PLAN: r0=363(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=156(y), r7=47(width), r8=58(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=143(x1), r11=107(y1), r12=402(x2), r13=38(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 291
LDI r6, 156
LDI r7, 47
LDI r8, 58
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 107
LDI r12, 402
LDI r13, 38
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
