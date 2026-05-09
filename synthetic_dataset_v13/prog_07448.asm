; DESCRIPTION: Composite: Renders a purple line between points (352, 181) and (174, 77) then Places a orange 75x48 rectangle at position (295, 0) then Places a orange circle of radius 24 at center (332, 169).
; PLAN: r0=352(x1), r1=181(y1), r2=174(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=0(y), r7=75(width), r8=48(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=332(x), r11=169(y), r12=24(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 352
LDI r1, 181
LDI r2, 174
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 0
LDI r7, 75
LDI r8, 48
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 169
LDI r12, 24
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
