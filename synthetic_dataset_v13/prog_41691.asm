; DESCRIPTION: Composite: Draws a orange line from (322, 54) to (391, 53) then Draws a yellow rectangle at (81, 147) with width 111 and height 38.
; PLAN: r0=322(x1), r1=54(y1), r2=391(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=81(x), r6=147(y), r7=111(width), r8=38(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 54
LDI r2, 391
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 147
LDI r7, 111
LDI r8, 38
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
