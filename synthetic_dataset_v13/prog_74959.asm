; DESCRIPTION: Composite: Creates a red circular shape at (139, 30) with radius 15 then Draws a white line from (486, 197) to (33, 151).
; PLAN: r0=139(x), r1=30(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x1), r6=197(y1), r7=33(x2), r8=151(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 30
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 197
LDI r7, 33
LDI r8, 151
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
