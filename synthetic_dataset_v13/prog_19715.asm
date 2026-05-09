; DESCRIPTION: Composite: Creates a green circular shape at (131, 162) with radius 28 then Draws a magenta line from (452, 198) to (255, 199).
; PLAN: r0=131(x), r1=162(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x1), r6=198(y1), r7=255(x2), r8=199(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 162
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 198
LDI r7, 255
LDI r8, 199
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
