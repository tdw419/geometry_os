; DESCRIPTION: Composite: Sets a single green pixel at (311, 68) then Draws a blue rectangle at (257, 103) with width 58 and height 110 then Places a cyan line segment connecting (385, 135) to (171, 245).
; PLAN: r0=311(x), r1=68(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=103(y), r7=58(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x1), r11=135(y1), r12=171(x2), r13=245(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 68
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 257
LDI r6, 103
LDI r7, 58
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 135
LDI r12, 171
LDI r13, 245
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
