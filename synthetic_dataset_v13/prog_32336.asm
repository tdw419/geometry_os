; DESCRIPTION: Composite: Places a white circle of radius 72 at center (280, 77) then Draws a purple rectangle at (140, 92) with width 111 and height 71.
; PLAN: r0=280(x), r1=77(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=92(y), r7=111(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 77
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 92
LDI r7, 111
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
