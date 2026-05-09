; DESCRIPTION: Composite: Draws a magenta line from (310, 18) to (295, 198) then Draws a blue rectangle at (106, 163) with width 35 and height 72.
; PLAN: r0=310(x1), r1=18(y1), r2=295(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=163(y), r7=35(width), r8=72(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 18
LDI r2, 295
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 163
LDI r7, 35
LDI r8, 72
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
