; DESCRIPTION: Composite: Renders a cyan line between points (358, 92) and (499, 7) then Creates a red circular shape at (214, 156) with radius 40.
; PLAN: r0=358(x1), r1=92(y1), r2=499(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=156(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 358
LDI r1, 92
LDI r2, 499
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 156
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
