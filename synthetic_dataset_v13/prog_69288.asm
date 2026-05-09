; DESCRIPTION: Composite: Renders a red line between points (456, 26) and (378, 62) then Draws a white circle centered at (143, 194) with radius 47.
; PLAN: r0=456(x1), r1=26(y1), r2=378(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=194(y), r7=47(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 456
LDI r1, 26
LDI r2, 378
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 194
LDI r7, 47
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
