; DESCRIPTION: Composite: Draws a green rectangle at (469, 54) with width 19 and height 101 then Draws a cyan line from (315, 2) to (31, 59).
; PLAN: r0=469(x), r1=54(y), r2=19(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x1), r6=2(y1), r7=31(x2), r8=59(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 54
LDI r2, 19
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 2
LDI r7, 31
LDI r8, 59
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
