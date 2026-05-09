; DESCRIPTION: Composite: Draws a blue rectangle at (302, 123) with width 72 and height 98 then Renders a blue line between points (7, 204) and (245, 241).
; PLAN: r0=302(x), r1=123(y), r2=72(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x1), r6=204(y1), r7=245(x2), r8=241(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 123
LDI r2, 72
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 204
LDI r7, 245
LDI r8, 241
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
