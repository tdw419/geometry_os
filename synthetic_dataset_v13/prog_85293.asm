; DESCRIPTION: Composite: Draws a purple rectangle at (368, 6) with width 42 and height 82 then Sets a single green pixel at (151, 113) then Places a yellow line segment connecting (37, 64) to (59, 251).
; PLAN: r0=368(x), r1=6(y), r2=42(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=113(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=37(x1), r11=64(y1), r12=59(x2), r13=251(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 6
LDI r2, 42
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 113
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 37
LDI r11, 64
LDI r12, 59
LDI r13, 251
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
