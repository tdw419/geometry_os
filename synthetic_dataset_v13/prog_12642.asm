; DESCRIPTION: Composite: Places a cyan line segment connecting (264, 114) to (335, 157) then Draws a red circle centered at (382, 75) with radius 17.
; PLAN: r0=264(x1), r1=114(y1), r2=335(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=75(y), r7=17(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 264
LDI r1, 114
LDI r2, 335
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 75
LDI r7, 17
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
