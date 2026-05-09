; DESCRIPTION: Composite: Draws a purple rectangle at (68, 8) with width 79 and height 32 then Places a black dot at position (495, 69) then Renders a white line between points (265, 63) and (16, 198).
; PLAN: r0=68(x), r1=8(y), r2=79(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x), r6=69(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=265(x1), r11=63(y1), r12=16(x2), r13=198(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 8
LDI r2, 79
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 69
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 265
LDI r11, 63
LDI r12, 16
LDI r13, 198
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
