; DESCRIPTION: Composite: Sets a single black pixel at (310, 0) then Places a black 40x43 rectangle at position (83, 67) then Renders a black line between points (351, 108) and (222, 18).
; PLAN: r0=310(x), r1=0(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=67(y), r7=40(width), r8=43(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=351(x1), r11=108(y1), r12=222(x2), r13=18(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 0
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 83
LDI r6, 67
LDI r7, 40
LDI r8, 43
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 108
LDI r12, 222
LDI r13, 18
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
