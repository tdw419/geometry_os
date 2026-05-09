; DESCRIPTION: Composite: Draws a blue line from (347, 231) to (56, 14) then Places a magenta 43x51 rectangle at position (97, 166).
; PLAN: r0=347(x1), r1=231(y1), r2=56(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=166(y), r7=43(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 231
LDI r2, 56
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 166
LDI r7, 43
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
