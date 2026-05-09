; DESCRIPTION: Composite: Creates a black rectangular region at (102, 85) spanning 16 by 62 pixels then Places a blue dot at position (284, 51) then Draws a orange line from (74, 13) to (462, 115).
; PLAN: r0=102(x), r1=85(y), r2=16(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=51(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=74(x1), r11=13(y1), r12=462(x2), r13=115(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 85
LDI r2, 16
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 51
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 74
LDI r11, 13
LDI r12, 462
LDI r13, 115
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
