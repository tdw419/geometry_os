; DESCRIPTION: Composite: Draws a green circle centered at (324, 145) with radius 71 then Renders a white box of size 57x18 starting at (289, 92).
; PLAN: r0=324(x), r1=145(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x), r6=92(y), r7=57(width), r8=18(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 145
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 92
LDI r7, 57
LDI r8, 18
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
