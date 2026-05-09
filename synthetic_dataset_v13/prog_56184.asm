; DESCRIPTION: Composite: Draws a blue line from (392, 35) to (434, 81) then Draws a purple rectangle at (390, 86) with width 76 and height 46.
; PLAN: r0=392(x1), r1=35(y1), r2=434(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=86(y), r7=76(width), r8=46(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 35
LDI r2, 434
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 86
LDI r7, 76
LDI r8, 46
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
