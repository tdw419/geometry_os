; DESCRIPTION: Composite: Places a magenta line segment connecting (166, 129) to (238, 253) then Places a red dot at position (233, 46) then Draws a white rectangle at (209, 53) with width 101 and height 118.
; PLAN: r0=166(x1), r1=129(y1), r2=238(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=46(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=209(x), r11=53(y), r12=101(width), r13=118(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 129
LDI r2, 238
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 46
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 209
LDI r11, 53
LDI r12, 101
LDI r13, 118
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
