; DESCRIPTION: Composite: Places a blue 104x40 rectangle at position (347, 100) then Draws a blue line from (225, 119) to (501, 170).
; PLAN: r0=347(x), r1=100(y), r2=104(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x1), r6=119(y1), r7=501(x2), r8=170(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 100
LDI r2, 104
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 119
LDI r7, 501
LDI r8, 170
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
