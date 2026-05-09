; DESCRIPTION: Composite: Draws a green circle centered at (183, 30) with radius 19 then Renders a green box of size 91x61 starting at (352, 38) then Places a blue line segment connecting (142, 38) to (496, 82).
; PLAN: r0=183(x), r1=30(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=38(y), r7=91(width), r8=61(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=142(x1), r11=38(y1), r12=496(x2), r13=82(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 30
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 38
LDI r7, 91
LDI r8, 61
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 38
LDI r12, 496
LDI r13, 82
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
