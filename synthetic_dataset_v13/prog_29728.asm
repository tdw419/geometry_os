; DESCRIPTION: Composite: Draws a magenta rectangle at (372, 14) with width 85 and height 37 then Places a orange dot at position (48, 28) then Draws a white line from (211, 11) to (148, 68).
; PLAN: r0=372(x), r1=14(y), r2=85(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=48(x), r6=28(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=211(x1), r11=11(y1), r12=148(x2), r13=68(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 14
LDI r2, 85
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 28
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 211
LDI r11, 11
LDI r12, 148
LDI r13, 68
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
