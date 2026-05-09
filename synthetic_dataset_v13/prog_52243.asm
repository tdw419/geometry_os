; DESCRIPTION: Composite: Draws a blue rectangle at (194, 23) with width 82 and height 65 then Places a purple line segment connecting (362, 83) to (53, 107) then Draws a yellow circle centered at (443, 164) with radius 27.
; PLAN: r0=194(x), r1=23(y), r2=82(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x1), r6=83(y1), r7=53(x2), r8=107(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=443(x), r11=164(y), r12=27(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 194
LDI r1, 23
LDI r2, 82
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 83
LDI r7, 53
LDI r8, 107
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 164
LDI r12, 27
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
