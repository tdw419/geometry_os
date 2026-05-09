; DESCRIPTION: Composite: Places a cyan line segment connecting (62, 234) to (332, 249) then Draws a cyan rectangle at (66, 35) with width 101 and height 54.
; PLAN: r0=62(x1), r1=234(y1), r2=332(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=35(y), r7=101(width), r8=54(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 234
LDI r2, 332
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 35
LDI r7, 101
LDI r8, 54
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
