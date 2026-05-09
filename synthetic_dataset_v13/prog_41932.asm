; DESCRIPTION: Composite: Draws a red rectangle at (363, 83) with width 64 and height 77 then Places a blue dot at position (49, 101) then Places a orange line segment connecting (53, 223) to (449, 30).
; PLAN: r0=363(x), r1=83(y), r2=64(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x), r6=101(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=53(x1), r11=223(y1), r12=449(x2), r13=30(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 83
LDI r2, 64
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 101
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 53
LDI r11, 223
LDI r12, 449
LDI r13, 30
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
