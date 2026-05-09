; DESCRIPTION: Composite: Places a green circle of radius 48 at center (163, 68) then Creates a green rectangular region at (73, 112) spanning 74 by 76 pixels.
; PLAN: r0=163(x), r1=68(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=112(y), r7=74(width), r8=76(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 68
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 112
LDI r7, 74
LDI r8, 76
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
