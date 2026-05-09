; DESCRIPTION: Composite: Draws a green line from (466, 62) to (489, 133) then Places a black dot at position (292, 167) then Places a magenta 38x108 rectangle at position (425, 54).
; PLAN: r0=466(x1), r1=62(y1), r2=489(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=167(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=425(x), r11=54(y), r12=38(width), r13=108(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 62
LDI r2, 489
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 167
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 425
LDI r11, 54
LDI r12, 38
LDI r13, 108
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
