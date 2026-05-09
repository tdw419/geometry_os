; DESCRIPTION: Composite: Draws a purple rectangle at (365, 198) with width 72 and height 46 then Draws a black line from (106, 160) to (406, 238).
; PLAN: r0=365(x), r1=198(y), r2=72(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x1), r6=160(y1), r7=406(x2), r8=238(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 198
LDI r2, 72
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 160
LDI r7, 406
LDI r8, 238
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
