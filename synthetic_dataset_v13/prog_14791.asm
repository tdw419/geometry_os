; DESCRIPTION: Composite: Draws a green line from (261, 237) to (316, 245) then Draws a purple rectangle at (375, 41) with width 47 and height 70.
; PLAN: r0=261(x1), r1=237(y1), r2=316(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=41(y), r7=47(width), r8=70(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 237
LDI r2, 316
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 41
LDI r7, 47
LDI r8, 70
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
