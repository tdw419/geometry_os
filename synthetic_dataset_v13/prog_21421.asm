; DESCRIPTION: Composite: Sets a single magenta pixel at (122, 66) then Draws a cyan line from (506, 131) to (352, 238) then Draws a orange rectangle at (263, 147) with width 15 and height 25.
; PLAN: r0=122(x), r1=66(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=506(x1), r6=131(y1), r7=352(x2), r8=238(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=147(y), r12=15(width), r13=25(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 66
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 506
LDI r6, 131
LDI r7, 352
LDI r8, 238
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 147
LDI r12, 15
LDI r13, 25
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
