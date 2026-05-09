; DESCRIPTION: Composite: Draws a blue circle centered at (341, 123) with radius 72 then Draws a green line from (302, 46) to (436, 6).
; PLAN: r0=341(x), r1=123(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x1), r6=46(y1), r7=436(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 123
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 46
LDI r7, 436
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
