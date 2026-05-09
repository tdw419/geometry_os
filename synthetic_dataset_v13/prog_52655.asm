; DESCRIPTION: Composite: Draws a cyan circle centered at (113, 166) with radius 23 then Renders a black line between points (461, 60) and (179, 143).
; PLAN: r0=113(x), r1=166(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x1), r6=60(y1), r7=179(x2), r8=143(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 166
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 60
LDI r7, 179
LDI r8, 143
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
