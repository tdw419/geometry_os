; DESCRIPTION: Composite: Draws a cyan rectangle at (374, 11) with width 73 and height 38 then Places a cyan line segment connecting (495, 59) to (339, 203).
; PLAN: r0=374(x), r1=11(y), r2=73(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x1), r6=59(y1), r7=339(x2), r8=203(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 11
LDI r2, 73
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 59
LDI r7, 339
LDI r8, 203
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
