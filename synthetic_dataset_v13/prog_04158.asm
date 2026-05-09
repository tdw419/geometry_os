; DESCRIPTION: Composite: Places a green line segment connecting (308, 192) to (29, 61) then Places a green dot at position (467, 210) then Draws a cyan rectangle at (156, 133) with width 25 and height 47.
; PLAN: r0=308(x1), r1=192(y1), r2=29(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=210(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=156(x), r11=133(y), r12=25(width), r13=47(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 192
LDI r2, 29
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 210
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 156
LDI r11, 133
LDI r12, 25
LDI r13, 47
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
