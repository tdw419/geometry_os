; DESCRIPTION: Composite: Renders a magenta line between points (364, 217) and (79, 1) then Creates a blue rectangular region at (285, 59) spanning 109 by 42 pixels then Places a magenta circle of radius 62 at center (255, 103).
; PLAN: r0=364(x1), r1=217(y1), r2=79(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=59(y), r7=109(width), r8=42(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x), r11=103(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 217
LDI r2, 79
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 59
LDI r7, 109
LDI r8, 42
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 103
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
