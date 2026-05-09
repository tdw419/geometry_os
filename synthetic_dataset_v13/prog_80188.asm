; DESCRIPTION: Composite: Renders a magenta line between points (228, 249) and (45, 49) then Creates a purple rectangular region at (429, 100) spanning 12 by 82 pixels then Draws a purple circle centered at (59, 116) with radius 48.
; PLAN: r0=228(x1), r1=249(y1), r2=45(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=100(y), r7=12(width), r8=82(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=59(x), r11=116(y), r12=48(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 228
LDI r1, 249
LDI r2, 45
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 100
LDI r7, 12
LDI r8, 82
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 116
LDI r12, 48
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
