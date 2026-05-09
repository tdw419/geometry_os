; DESCRIPTION: Composite: Draws a yellow circle centered at (324, 188) with radius 43 then Places a red line segment connecting (307, 77) to (482, 50).
; PLAN: r0=324(x), r1=188(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x1), r6=77(y1), r7=482(x2), r8=50(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 188
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 77
LDI r7, 482
LDI r8, 50
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
