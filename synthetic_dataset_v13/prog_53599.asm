; DESCRIPTION: Composite: Draws a blue line from (32, 203) to (452, 49) then Sets a single orange pixel at (197, 204) then Draws a white rectangle at (138, 48) with width 75 and height 73.
; PLAN: r0=32(x1), r1=203(y1), r2=452(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=204(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=48(y), r12=75(width), r13=73(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 203
LDI r2, 452
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 204
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 138
LDI r11, 48
LDI r12, 75
LDI r13, 73
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
