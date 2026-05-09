; DESCRIPTION: Composite: Draws a green circle centered at (238, 200) with radius 50 then Places a green line segment connecting (497, 126) to (352, 250).
; PLAN: r0=238(x), r1=200(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x1), r6=126(y1), r7=352(x2), r8=250(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 200
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 126
LDI r7, 352
LDI r8, 250
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
