; DESCRIPTION: Composite: Draws a orange circle centered at (157, 105) with radius 69 then Places a purple 21x60 rectangle at position (334, 27) then Renders a cyan line between points (455, 210) and (202, 240).
; PLAN: r0=157(x), r1=105(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=27(y), r7=21(width), r8=60(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=455(x1), r11=210(y1), r12=202(x2), r13=240(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 105
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 27
LDI r7, 21
LDI r8, 60
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 210
LDI r12, 202
LDI r13, 240
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
