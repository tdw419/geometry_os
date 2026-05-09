; DESCRIPTION: Composite: Renders a magenta line between points (114, 14) and (124, 243) then Draws a orange circle centered at (440, 73) with radius 62 then Places a green 40x82 rectangle at position (100, 29).
; PLAN: r0=114(x1), r1=14(y1), r2=124(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=73(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x), r11=29(y), r12=40(width), r13=82(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 14
LDI r2, 124
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 73
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 29
LDI r12, 40
LDI r13, 82
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
