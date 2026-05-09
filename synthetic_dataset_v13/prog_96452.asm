; DESCRIPTION: Composite: Draws a green line from (108, 103) to (483, 145) then Sets a single cyan pixel at (25, 140) then Places a orange 83x17 rectangle at position (403, 114).
; PLAN: r0=108(x1), r1=103(y1), r2=483(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=140(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=403(x), r11=114(y), r12=83(width), r13=17(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 103
LDI r2, 483
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 140
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 403
LDI r11, 114
LDI r12, 83
LDI r13, 17
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
