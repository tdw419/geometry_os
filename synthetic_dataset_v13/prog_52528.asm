; DESCRIPTION: Composite: Draws a white circle centered at (411, 65) with radius 48 then Places a blue line segment connecting (310, 117) to (139, 152).
; PLAN: r0=411(x), r1=65(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x1), r6=117(y1), r7=139(x2), r8=152(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 65
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 117
LDI r7, 139
LDI r8, 152
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
