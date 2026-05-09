; DESCRIPTION: Composite: Places a white circle of radius 46 at center (405, 181) then Renders a cyan line between points (288, 86) and (159, 29) then Draws a purple rectangle at (401, 159) with width 93 and height 90.
; PLAN: r0=405(x), r1=181(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x1), r6=86(y1), r7=159(x2), r8=29(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=401(x), r11=159(y), r12=93(width), r13=90(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 181
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 86
LDI r7, 159
LDI r8, 29
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 159
LDI r12, 93
LDI r13, 90
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
