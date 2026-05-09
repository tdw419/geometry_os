; DESCRIPTION: Composite: Draws a purple line from (108, 91) to (169, 36) then Draws a magenta rectangle at (95, 92) with width 26 and height 45 then Places a green dot at position (308, 209).
; PLAN: r0=108(x1), r1=91(y1), r2=169(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=92(y), r7=26(width), r8=45(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=209(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 91
LDI r2, 169
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 92
LDI r7, 26
LDI r8, 45
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 209
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
