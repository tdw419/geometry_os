; DESCRIPTION: Composite: Places a orange circle of radius 47 at center (347, 186) then Places a blue 16x28 rectangle at position (191, 64) then Renders a cyan line between points (88, 50) and (174, 153).
; PLAN: r0=347(x), r1=186(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=64(y), r7=16(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x1), r11=50(y1), r12=174(x2), r13=153(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 186
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 64
LDI r7, 16
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 50
LDI r12, 174
LDI r13, 153
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
