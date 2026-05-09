; DESCRIPTION: Composite: Draws a red rectangle at (165, 48) with width 57 and height 62 then Places a red dot at position (151, 172) then Renders a cyan line between points (396, 76) and (483, 173).
; PLAN: r0=165(x), r1=48(y), r2=57(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=172(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=396(x1), r11=76(y1), r12=483(x2), r13=173(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 48
LDI r2, 57
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 172
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 396
LDI r11, 76
LDI r12, 483
LDI r13, 173
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
