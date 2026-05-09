; DESCRIPTION: Composite: Draws a cyan rectangle at (78, 86) with width 39 and height 10 then Draws a orange circle centered at (281, 139) with radius 19 then Renders a magenta line between points (461, 177) and (415, 169).
; PLAN: r0=78(x), r1=86(y), r2=39(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=139(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=461(x1), r11=177(y1), r12=415(x2), r13=169(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 86
LDI r2, 39
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 139
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 461
LDI r11, 177
LDI r12, 415
LDI r13, 169
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
