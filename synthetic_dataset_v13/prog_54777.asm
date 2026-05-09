; DESCRIPTION: Composite: Creates a blue circular shape at (408, 74) with radius 40 then Draws a cyan line from (165, 17) to (240, 235).
; PLAN: r0=408(x), r1=74(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x1), r6=17(y1), r7=240(x2), r8=235(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 74
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 17
LDI r7, 240
LDI r8, 235
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
