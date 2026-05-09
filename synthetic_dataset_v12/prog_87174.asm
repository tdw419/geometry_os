; DESCRIPTION: Composite: Draws a red rectangle at (153, 65) with width 77 and height 92 then Renders a red disk with center (165, 204) and radius 48.
; PLAN: r0=153(x), r1=65(y), r2=77(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=204(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 153
LDI r1, 65
LDI r2, 77
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 204
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
