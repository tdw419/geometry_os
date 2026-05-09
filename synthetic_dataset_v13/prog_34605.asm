; DESCRIPTION: Composite: Creates a magenta rectangular region at (380, 141) spanning 33 by 109 pixels then Places a red dot at position (120, 32) then Draws a purple line from (323, 92) to (304, 245).
; PLAN: r0=380(x), r1=141(y), r2=33(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=32(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=323(x1), r11=92(y1), r12=304(x2), r13=245(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 141
LDI r2, 33
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 32
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 323
LDI r11, 92
LDI r12, 304
LDI r13, 245
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
