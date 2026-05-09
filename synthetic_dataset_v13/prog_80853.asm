; DESCRIPTION: Composite: Draws a black circle centered at (267, 153) with radius 32 then Draws a cyan line from (359, 56) to (113, 179).
; PLAN: r0=267(x), r1=153(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x1), r6=56(y1), r7=113(x2), r8=179(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 153
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 56
LDI r7, 113
LDI r8, 179
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
