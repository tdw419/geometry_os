; DESCRIPTION: Composite: Places a yellow dot at position (446, 101) then Places a white line segment connecting (319, 174) to (318, 150) then Renders a white box of size 66x69 starting at (172, 176).
; PLAN: r0=446(x), r1=101(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=174(y1), r7=318(x2), r8=150(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=176(y), r12=66(width), r13=69(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 101
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 319
LDI r6, 174
LDI r7, 318
LDI r8, 150
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 176
LDI r12, 66
LDI r13, 69
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
