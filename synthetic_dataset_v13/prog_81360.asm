; DESCRIPTION: Composite: Draws a orange line from (138, 19) to (247, 66) then Draws a cyan rectangle at (349, 58) with width 69 and height 21 then Sets a single purple pixel at (421, 195).
; PLAN: r0=138(x1), r1=19(y1), r2=247(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=58(y), r7=69(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=421(x), r11=195(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 138
LDI r1, 19
LDI r2, 247
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 58
LDI r7, 69
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 195
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
