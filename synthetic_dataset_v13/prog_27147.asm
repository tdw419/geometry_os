; DESCRIPTION: Composite: Draws a white line from (482, 69) to (350, 95) then Draws a red rectangle at (93, 145) with width 117 and height 84 then Sets a single blue pixel at (275, 72).
; PLAN: r0=482(x1), r1=69(y1), r2=350(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=145(y), r7=117(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=275(x), r11=72(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 482
LDI r1, 69
LDI r2, 350
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 145
LDI r7, 117
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 72
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
