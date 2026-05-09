; DESCRIPTION: Composite: Draws a blue circle centered at (342, 206) with radius 11 then Places a magenta line segment connecting (61, 93) to (510, 97).
; PLAN: r0=342(x), r1=206(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x1), r6=93(y1), r7=510(x2), r8=97(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 206
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 93
LDI r7, 510
LDI r8, 97
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
