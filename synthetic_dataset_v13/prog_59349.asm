; DESCRIPTION: Composite: Draws a green line from (489, 209) to (190, 77) then Creates a yellow circular shape at (184, 73) with radius 61.
; PLAN: r0=489(x1), r1=209(y1), r2=190(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=73(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 489
LDI r1, 209
LDI r2, 190
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 73
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
