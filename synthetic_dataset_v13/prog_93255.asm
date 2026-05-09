; DESCRIPTION: Composite: Renders a cyan disk with center (238, 200) and radius 51 then Creates a white rectangular region at (314, 7) spanning 48 by 93 pixels.
; PLAN: r0=238(x), r1=200(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=7(y), r7=48(width), r8=93(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 200
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 7
LDI r7, 48
LDI r8, 93
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
