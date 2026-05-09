; DESCRIPTION: Composite: Sets a single green pixel at (362, 103) then Draws a black rectangle at (108, 85) with width 97 and height 33 then Draws a magenta line from (181, 45) to (484, 15).
; PLAN: r0=362(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=85(y), r7=97(width), r8=33(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=181(x1), r11=45(y1), r12=484(x2), r13=15(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 108
LDI r6, 85
LDI r7, 97
LDI r8, 33
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 45
LDI r12, 484
LDI r13, 15
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
