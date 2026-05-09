; DESCRIPTION: Composite: Renders a cyan box of size 90x45 starting at (43, 118) then Sets a single black pixel at (418, 166) then Places a white line segment connecting (62, 102) to (329, 67).
; PLAN: r0=43(x), r1=118(y), r2=90(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=166(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=62(x1), r11=102(y1), r12=329(x2), r13=67(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 118
LDI r2, 90
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 166
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 62
LDI r11, 102
LDI r12, 329
LDI r13, 67
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
