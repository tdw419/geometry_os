; DESCRIPTION: Composite: Draws a cyan rectangle at (462, 70) with width 21 and height 10 then Places a blue line segment connecting (307, 104) to (495, 160).
; PLAN: r0=462(x), r1=70(y), r2=21(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x1), r6=104(y1), r7=495(x2), r8=160(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 70
LDI r2, 21
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 104
LDI r7, 495
LDI r8, 160
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
