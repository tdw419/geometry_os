; DESCRIPTION: Composite: Draws a orange rectangle at (259, 48) with width 34 and height 82 then Places a magenta line segment connecting (364, 139) to (72, 58).
; PLAN: r0=259(x), r1=48(y), r2=34(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x1), r6=139(y1), r7=72(x2), r8=58(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 48
LDI r2, 34
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 139
LDI r7, 72
LDI r8, 58
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
