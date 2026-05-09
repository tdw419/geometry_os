; DESCRIPTION: Composite: Draws a black circle centered at (377, 94) with radius 64 then Renders a magenta line between points (105, 162) and (425, 249).
; PLAN: r0=377(x), r1=94(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x1), r6=162(y1), r7=425(x2), r8=249(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 94
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 162
LDI r7, 425
LDI r8, 249
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
