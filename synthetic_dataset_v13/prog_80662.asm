; DESCRIPTION: Composite: Renders a yellow line between points (47, 105) and (4, 133) then Creates a cyan circular shape at (85, 148) with radius 78 then Places a green 106x55 rectangle at position (78, 69).
; PLAN: r0=47(x1), r1=105(y1), r2=4(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=148(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=78(x), r11=69(y), r12=106(width), r13=55(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 105
LDI r2, 4
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 148
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 78
LDI r11, 69
LDI r12, 106
LDI r13, 55
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
