; DESCRIPTION: Composite: Draws a blue line from (137, 49) to (188, 225) then Draws a cyan circle centered at (237, 126) with radius 61.
; PLAN: r0=137(x1), r1=49(y1), r2=188(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=126(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 137
LDI r1, 49
LDI r2, 188
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 126
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
