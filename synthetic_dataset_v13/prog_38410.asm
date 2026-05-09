; DESCRIPTION: Composite: Draws a blue rectangle at (490, 67) with width 19 and height 85 then Places a orange dot at position (405, 24) then Draws a black line from (300, 107) to (277, 191).
; PLAN: r0=490(x), r1=67(y), r2=19(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=24(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=300(x1), r11=107(y1), r12=277(x2), r13=191(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 67
LDI r2, 19
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 24
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 300
LDI r11, 107
LDI r12, 277
LDI r13, 191
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
