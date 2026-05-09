; DESCRIPTION: Composite: Creates a white circular shape at (289, 163) with radius 56 then Draws a white line from (112, 143) to (154, 40).
; PLAN: r0=289(x), r1=163(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x1), r6=143(y1), r7=154(x2), r8=40(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 163
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 143
LDI r7, 154
LDI r8, 40
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
