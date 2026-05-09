; DESCRIPTION: Composite: Draws a purple rectangle at (193, 92) with width 25 and height 67 then Renders a yellow line between points (282, 250) and (352, 194) then Places a red dot at position (132, 184).
; PLAN: r0=193(x), r1=92(y), r2=25(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x1), r6=250(y1), r7=352(x2), r8=194(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=132(x), r11=184(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 92
LDI r2, 25
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 250
LDI r7, 352
LDI r8, 194
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 132
LDI r11, 184
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
