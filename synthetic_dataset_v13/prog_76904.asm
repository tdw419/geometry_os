; DESCRIPTION: Composite: Places a white dot at position (50, 99) then Draws a green rectangle at (149, 123) with width 45 and height 105 then Places a red line segment connecting (329, 91) to (504, 204).
; PLAN: r0=50(x), r1=99(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=123(y), r7=45(width), r8=105(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x1), r11=91(y1), r12=504(x2), r13=204(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 99
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 123
LDI r7, 45
LDI r8, 105
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 91
LDI r12, 504
LDI r13, 204
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
