; DESCRIPTION: Composite: Draws a purple line from (127, 171) to (304, 196) then Places a green circle of radius 42 at center (365, 60) then Creates a green rectangular region at (353, 173) spanning 33 by 34 pixels.
; PLAN: r0=127(x1), r1=171(y1), r2=304(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=365(x), r6=60(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=353(x), r11=173(y), r12=33(width), r13=34(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 171
LDI r2, 304
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 60
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 353
LDI r11, 173
LDI r12, 33
LDI r13, 34
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
