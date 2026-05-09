; DESCRIPTION: Composite: Places a purple 87x59 rectangle at position (174, 39) then Places a red line segment connecting (6, 93) to (442, 143) then Creates a purple circular shape at (261, 130) with radius 27.
; PLAN: r0=174(x), r1=39(y), r2=87(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=6(x1), r6=93(y1), r7=442(x2), r8=143(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=130(y), r12=27(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 39
LDI r2, 87
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 93
LDI r7, 442
LDI r8, 143
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 130
LDI r12, 27
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
