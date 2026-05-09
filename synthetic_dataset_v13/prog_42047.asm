; DESCRIPTION: Composite: Places a green line segment connecting (306, 30) to (202, 184) then Draws a green circle centered at (216, 117) with radius 45.
; PLAN: r0=306(x1), r1=30(y1), r2=202(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=117(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 306
LDI r1, 30
LDI r2, 202
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 117
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
