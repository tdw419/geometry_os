; DESCRIPTION: Composite: Draws a blue rectangle at (413, 146) with width 95 and height 62 then Sets a single blue pixel at (121, 120) then Places a orange line segment connecting (432, 168) to (458, 109).
; PLAN: r0=413(x), r1=146(y), r2=95(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x), r6=120(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=432(x1), r11=168(y1), r12=458(x2), r13=109(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 146
LDI r2, 95
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 120
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 432
LDI r11, 168
LDI r12, 458
LDI r13, 109
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
