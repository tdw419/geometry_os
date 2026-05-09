; DESCRIPTION: Composite: Draws a red rectangle at (433, 119) with width 65 and height 82 then Places a red dot at position (509, 191) then Draws a red line from (385, 63) to (29, 163).
; PLAN: r0=433(x), r1=119(y), r2=65(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x), r6=191(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=385(x1), r11=63(y1), r12=29(x2), r13=163(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 119
LDI r2, 65
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 191
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 385
LDI r11, 63
LDI r12, 29
LDI r13, 163
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
