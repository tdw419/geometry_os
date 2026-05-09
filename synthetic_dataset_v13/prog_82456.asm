; DESCRIPTION: Composite: Draws a blue rectangle at (105, 78) with width 74 and height 35 then Places a black dot at position (66, 180) then Draws a red line from (492, 145) to (153, 208).
; PLAN: r0=105(x), r1=78(y), r2=74(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=180(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=492(x1), r11=145(y1), r12=153(x2), r13=208(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 78
LDI r2, 74
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 180
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 492
LDI r11, 145
LDI r12, 153
LDI r13, 208
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
