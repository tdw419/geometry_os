; DESCRIPTION: Composite: Creates a red rectangular region at (414, 41) spanning 43 by 84 pixels then Places a magenta dot at position (148, 251) then Draws a white line from (365, 16) to (369, 86).
; PLAN: r0=414(x), r1=41(y), r2=43(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=251(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=365(x1), r11=16(y1), r12=369(x2), r13=86(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 41
LDI r2, 43
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 251
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 365
LDI r11, 16
LDI r12, 369
LDI r13, 86
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
