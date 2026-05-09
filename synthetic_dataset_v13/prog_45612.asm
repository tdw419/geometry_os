; DESCRIPTION: Composite: Sets a single red pixel at (304, 13) then Draws a red line from (337, 62) to (123, 221) then Renders a purple box of size 81x82 starting at (304, 64).
; PLAN: r0=304(x), r1=13(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=62(y1), r7=123(x2), r8=221(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=304(x), r11=64(y), r12=81(width), r13=82(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 13
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 337
LDI r6, 62
LDI r7, 123
LDI r8, 221
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 64
LDI r12, 81
LDI r13, 82
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
