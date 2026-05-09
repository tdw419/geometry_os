; DESCRIPTION: Composite: Draws a green line from (126, 4) to (380, 38) then Draws a purple rectangle at (9, 88) with width 56 and height 105 then Places a orange dot at position (418, 73).
; PLAN: r0=126(x1), r1=4(y1), r2=380(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=9(x), r6=88(y), r7=56(width), r8=105(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x), r11=73(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 126
LDI r1, 4
LDI r2, 380
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 88
LDI r7, 56
LDI r8, 105
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 73
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
