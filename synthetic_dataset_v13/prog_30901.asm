; DESCRIPTION: Composite: Creates a white circular shape at (376, 56) with radius 12 then Renders a red line between points (405, 80) and (333, 163).
; PLAN: r0=376(x), r1=56(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x1), r6=80(y1), r7=333(x2), r8=163(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 56
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 80
LDI r7, 333
LDI r8, 163
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
