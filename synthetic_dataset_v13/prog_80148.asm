; DESCRIPTION: Composite: Draws a green rectangle at (77, 148) with width 82 and height 59 then Draws a orange line from (314, 182) to (263, 225).
; PLAN: r0=77(x), r1=148(y), r2=82(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x1), r6=182(y1), r7=263(x2), r8=225(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 148
LDI r2, 82
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 182
LDI r7, 263
LDI r8, 225
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
