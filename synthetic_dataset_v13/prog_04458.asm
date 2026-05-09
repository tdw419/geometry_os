; DESCRIPTION: Composite: Sets a single red pixel at (268, 176) then Draws a cyan line from (130, 237) to (340, 30) then Draws a red rectangle at (350, 41) with width 35 and height 30.
; PLAN: r0=268(x), r1=176(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=130(x1), r6=237(y1), r7=340(x2), r8=30(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=350(x), r11=41(y), r12=35(width), r13=30(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 176
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 130
LDI r6, 237
LDI r7, 340
LDI r8, 30
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 41
LDI r12, 35
LDI r13, 30
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
