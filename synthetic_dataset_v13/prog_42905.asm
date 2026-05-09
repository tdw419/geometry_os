; DESCRIPTION: Composite: Places a blue 86x69 rectangle at position (246, 1) then Renders a magenta disk with center (217, 70) and radius 27 then Draws a purple line from (69, 5) to (173, 176).
; PLAN: r0=246(x), r1=1(y), r2=86(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=70(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=69(x1), r11=5(y1), r12=173(x2), r13=176(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 1
LDI r2, 86
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 70
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 69
LDI r11, 5
LDI r12, 173
LDI r13, 176
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
