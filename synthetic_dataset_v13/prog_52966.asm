; DESCRIPTION: Composite: Draws a cyan circle centered at (167, 98) with radius 63 then Renders a purple line between points (475, 77) and (494, 55).
; PLAN: r0=167(x), r1=98(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=475(x1), r6=77(y1), r7=494(x2), r8=55(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 98
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 475
LDI r6, 77
LDI r7, 494
LDI r8, 55
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
