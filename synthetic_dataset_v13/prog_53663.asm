; DESCRIPTION: Composite: Sets a single black pixel at (39, 45) then Places a cyan 56x23 rectangle at position (227, 145) then Places a red line segment connecting (359, 206) to (181, 198).
; PLAN: r0=39(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=145(y), r7=56(width), r8=23(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=359(x1), r11=206(y1), r12=181(x2), r13=198(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 45
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 227
LDI r6, 145
LDI r7, 56
LDI r8, 23
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 206
LDI r12, 181
LDI r13, 198
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
