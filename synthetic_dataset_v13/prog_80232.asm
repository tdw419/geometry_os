; DESCRIPTION: Composite: Draws a purple line from (368, 53) to (284, 180) then Draws a orange rectangle at (158, 12) with width 61 and height 104 then Sets a single red pixel at (102, 173).
; PLAN: r0=368(x1), r1=53(y1), r2=284(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=12(y), r7=61(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=102(x), r11=173(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 368
LDI r1, 53
LDI r2, 284
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 12
LDI r7, 61
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 173
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
