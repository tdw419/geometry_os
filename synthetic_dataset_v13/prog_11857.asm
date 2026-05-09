; DESCRIPTION: Composite: Places a green dot at position (474, 160) then Draws a cyan rectangle at (29, 23) with width 22 and height 97 then Places a cyan line segment connecting (74, 212) to (380, 217).
; PLAN: r0=474(x), r1=160(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=29(x), r6=23(y), r7=22(width), r8=97(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=74(x1), r11=212(y1), r12=380(x2), r13=217(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 474
LDI r1, 160
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 29
LDI r6, 23
LDI r7, 22
LDI r8, 97
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 212
LDI r12, 380
LDI r13, 217
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
