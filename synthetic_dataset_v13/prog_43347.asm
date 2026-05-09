; DESCRIPTION: Composite: Places a magenta 42x82 rectangle at position (105, 30) then Places a yellow dot at position (261, 25) then Draws a purple line from (435, 27) to (316, 73).
; PLAN: r0=105(x), r1=30(y), r2=42(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=25(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=435(x1), r11=27(y1), r12=316(x2), r13=73(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 30
LDI r2, 42
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 25
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 435
LDI r11, 27
LDI r12, 316
LDI r13, 73
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
