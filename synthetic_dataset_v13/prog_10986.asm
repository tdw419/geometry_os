; DESCRIPTION: Composite: Places a green circle of radius 56 at center (312, 109) then Draws a green line from (230, 56) to (240, 228) then Places a orange dot at position (26, 153).
; PLAN: r0=312(x), r1=109(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x1), r6=56(y1), r7=240(x2), r8=228(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=26(x), r11=153(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 109
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 56
LDI r7, 240
LDI r8, 228
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 153
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
