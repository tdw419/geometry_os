; DESCRIPTION: Composite: Renders a yellow box of size 116x85 starting at (264, 27) then Places a red dot at position (255, 29) then Draws a yellow line from (459, 109) to (508, 128).
; PLAN: r0=264(x), r1=27(y), r2=116(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=29(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=459(x1), r11=109(y1), r12=508(x2), r13=128(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 27
LDI r2, 116
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 29
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 459
LDI r11, 109
LDI r12, 508
LDI r13, 128
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
