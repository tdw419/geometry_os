; DESCRIPTION: Composite: Draws a green line from (190, 28) to (49, 210) then Creates a orange circular shape at (419, 113) with radius 36 then Places a white 99x109 rectangle at position (160, 106).
; PLAN: r0=190(x1), r1=28(y1), r2=49(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=113(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=160(x), r11=106(y), r12=99(width), r13=109(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 28
LDI r2, 49
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 113
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 160
LDI r11, 106
LDI r12, 99
LDI r13, 109
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
