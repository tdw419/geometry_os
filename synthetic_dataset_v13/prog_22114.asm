; DESCRIPTION: Composite: Places a purple 74x42 rectangle at position (383, 5) then Places a blue circle of radius 33 at center (304, 109) then Draws a cyan line from (24, 20) to (77, 136).
; PLAN: r0=383(x), r1=5(y), r2=74(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=109(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x1), r11=20(y1), r12=77(x2), r13=136(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 5
LDI r2, 74
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 109
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 20
LDI r12, 77
LDI r13, 136
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
