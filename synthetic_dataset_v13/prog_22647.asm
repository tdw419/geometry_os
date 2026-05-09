; DESCRIPTION: Composite: Sets a single purple pixel at (44, 88) then Places a red line segment connecting (284, 72) to (330, 165) then Places a red 83x41 rectangle at position (215, 44).
; PLAN: r0=44(x), r1=88(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=284(x1), r6=72(y1), r7=330(x2), r8=165(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=44(y), r12=83(width), r13=41(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 88
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 284
LDI r6, 72
LDI r7, 330
LDI r8, 165
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 44
LDI r12, 83
LDI r13, 41
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
