; DESCRIPTION: Composite: Places a black line segment connecting (285, 145) to (428, 39) then Draws a red rectangle at (289, 15) with width 31 and height 120 then Places a purple dot at position (408, 150).
; PLAN: r0=285(x1), r1=145(y1), r2=428(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=15(y), r7=31(width), r8=120(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=150(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 145
LDI r2, 428
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 15
LDI r7, 31
LDI r8, 120
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 150
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
