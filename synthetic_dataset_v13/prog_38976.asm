; DESCRIPTION: Composite: Creates a magenta circular shape at (167, 112) with radius 77 then Renders a yellow line between points (322, 25) and (176, 102).
; PLAN: r0=167(x), r1=112(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=25(y1), r7=176(x2), r8=102(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 112
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 25
LDI r7, 176
LDI r8, 102
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
