; DESCRIPTION: Composite: Places a red 85x82 rectangle at position (248, 126) then Places a orange dot at position (58, 116) then Draws a blue line from (244, 210) to (398, 44).
; PLAN: r0=248(x), r1=126(y), r2=85(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=116(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=244(x1), r11=210(y1), r12=398(x2), r13=44(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 126
LDI r2, 85
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 116
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 244
LDI r11, 210
LDI r12, 398
LDI r13, 44
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
