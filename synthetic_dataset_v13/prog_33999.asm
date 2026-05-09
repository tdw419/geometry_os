; DESCRIPTION: Composite: Creates a white circular shape at (399, 159) with radius 17 then Draws a blue line from (11, 64) to (171, 228).
; PLAN: r0=399(x), r1=159(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x1), r6=64(y1), r7=171(x2), r8=228(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 159
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 64
LDI r7, 171
LDI r8, 228
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
