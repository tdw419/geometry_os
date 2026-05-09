; DESCRIPTION: Composite: Places a purple 23x17 rectangle at position (412, 39) then Places a orange line segment connecting (379, 92) to (204, 165) then Places a magenta dot at position (426, 107).
; PLAN: r0=412(x), r1=39(y), r2=23(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x1), r6=92(y1), r7=204(x2), r8=165(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=426(x), r11=107(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 412
LDI r1, 39
LDI r2, 23
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 92
LDI r7, 204
LDI r8, 165
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 107
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
