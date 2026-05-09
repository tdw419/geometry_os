; DESCRIPTION: Composite: Sets a single white pixel at (326, 197) then Renders a orange line between points (508, 140) and (59, 179) then Places a orange 83x92 rectangle at position (24, 85).
; PLAN: r0=326(x), r1=197(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=508(x1), r6=140(y1), r7=59(x2), r8=179(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=24(x), r11=85(y), r12=83(width), r13=92(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 197
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 508
LDI r6, 140
LDI r7, 59
LDI r8, 179
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 85
LDI r12, 83
LDI r13, 92
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
