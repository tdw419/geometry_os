; DESCRIPTION: Composite: Sets a single yellow pixel at (418, 0) then Draws a green line from (506, 66) to (11, 214) then Draws a cyan rectangle at (2, 109) with width 14 and height 116.
; PLAN: r0=418(x), r1=0(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=506(x1), r6=66(y1), r7=11(x2), r8=214(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=109(y), r12=14(width), r13=116(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 0
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 506
LDI r6, 66
LDI r7, 11
LDI r8, 214
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 109
LDI r12, 14
LDI r13, 116
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
