; DESCRIPTION: Composite: Renders a blue box of size 103x75 starting at (285, 147) then Places a magenta line segment connecting (423, 51) to (141, 82).
; PLAN: r0=285(x), r1=147(y), r2=103(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x1), r6=51(y1), r7=141(x2), r8=82(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 147
LDI r2, 103
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 51
LDI r7, 141
LDI r8, 82
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
