; DESCRIPTION: Composite: Sets a single white pixel at (303, 107) then Draws a purple rectangle at (161, 127) with width 59 and height 84 then Places a yellow line segment connecting (434, 158) to (413, 183).
; PLAN: r0=303(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=161(x), r6=127(y), r7=59(width), r8=84(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=434(x1), r11=158(y1), r12=413(x2), r13=183(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 161
LDI r6, 127
LDI r7, 59
LDI r8, 84
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 158
LDI r12, 413
LDI r13, 183
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
