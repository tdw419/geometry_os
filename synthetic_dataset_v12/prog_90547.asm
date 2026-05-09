; DESCRIPTION: Composite: Places a cyan 47x112 rectangle at position (355, 36) then Draws a purple line from (388, 142) to (324, 213) then Places a purple circle of radius 41 at center (421, 63).
; PLAN: r0=355(x), r1=36(y), r2=47(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x1), r6=142(y1), r7=324(x2), r8=213(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=421(x), r11=63(y), r12=41(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 36
LDI r2, 47
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 142
LDI r7, 324
LDI r8, 213
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 63
LDI r12, 41
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
