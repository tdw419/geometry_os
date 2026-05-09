; DESCRIPTION: Composite: Places a cyan line segment connecting (269, 183) to (246, 102) then Draws a red circle centered at (227, 72) with radius 63.
; PLAN: r0=269(x1), r1=183(y1), r2=246(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=72(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 269
LDI r1, 183
LDI r2, 246
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 72
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
