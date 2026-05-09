; DESCRIPTION: Composite: Draws a green circle centered at (475, 220) with radius 19 then Places a magenta line segment connecting (322, 105) to (284, 32).
; PLAN: r0=475(x), r1=220(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=105(y1), r7=284(x2), r8=32(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 220
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 105
LDI r7, 284
LDI r8, 32
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
