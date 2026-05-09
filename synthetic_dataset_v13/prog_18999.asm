; DESCRIPTION: Composite: Sets a single purple pixel at (189, 240) then Draws a red rectangle at (383, 40) with width 119 and height 100 then Draws a green line from (103, 49) to (402, 147).
; PLAN: r0=189(x), r1=240(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=40(y), r7=119(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=103(x1), r11=49(y1), r12=402(x2), r13=147(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 240
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 383
LDI r6, 40
LDI r7, 119
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 49
LDI r12, 402
LDI r13, 147
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
