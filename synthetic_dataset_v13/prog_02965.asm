; DESCRIPTION: Composite: Places a orange 43x79 rectangle at position (228, 126) then Sets a single cyan pixel at (112, 140) then Draws a yellow line from (436, 225) to (232, 139).
; PLAN: r0=228(x), r1=126(y), r2=43(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=140(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=436(x1), r11=225(y1), r12=232(x2), r13=139(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 126
LDI r2, 43
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 140
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 436
LDI r11, 225
LDI r12, 232
LDI r13, 139
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
