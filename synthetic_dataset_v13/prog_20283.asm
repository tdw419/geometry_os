; DESCRIPTION: Composite: Places a cyan line segment connecting (440, 73) to (412, 201) then Draws a cyan circle centered at (287, 173) with radius 50.
; PLAN: r0=440(x1), r1=73(y1), r2=412(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=173(y), r7=50(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 73
LDI r2, 412
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 173
LDI r7, 50
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
