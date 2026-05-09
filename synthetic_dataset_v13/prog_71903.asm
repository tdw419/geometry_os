; DESCRIPTION: Composite: Draws a purple rectangle at (204, 52) with width 103 and height 93 then Draws a magenta line from (457, 209) to (13, 219) then Sets a single orange pixel at (182, 41).
; PLAN: r0=204(x), r1=52(y), r2=103(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x1), r6=209(y1), r7=13(x2), r8=219(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=41(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 52
LDI r2, 103
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 209
LDI r7, 13
LDI r8, 219
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 41
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
