; DESCRIPTION: Composite: Draws a cyan line from (452, 179) to (123, 116) then Places a cyan circle of radius 52 at center (315, 167) then Places a orange 71x115 rectangle at position (72, 113).
; PLAN: r0=452(x1), r1=179(y1), r2=123(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=167(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=72(x), r11=113(y), r12=71(width), r13=115(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 179
LDI r2, 123
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 167
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 72
LDI r11, 113
LDI r12, 71
LDI r13, 115
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
