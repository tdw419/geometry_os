; DESCRIPTION: Composite: Places a black dot at position (16, 170) then Draws a yellow rectangle at (53, 78) with width 120 and height 67 then Places a cyan line segment connecting (83, 217) to (199, 46).
; PLAN: r0=16(x), r1=170(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=78(y), r7=120(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=83(x1), r11=217(y1), r12=199(x2), r13=46(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 170
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 53
LDI r6, 78
LDI r7, 120
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 217
LDI r12, 199
LDI r13, 46
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
