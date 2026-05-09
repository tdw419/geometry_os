; DESCRIPTION: Composite: Draws a cyan circle centered at (329, 36) with radius 32 then Renders a green line between points (414, 183) and (489, 102).
; PLAN: r0=329(x), r1=36(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x1), r6=183(y1), r7=489(x2), r8=102(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 36
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 183
LDI r7, 489
LDI r8, 102
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
