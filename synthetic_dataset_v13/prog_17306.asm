; DESCRIPTION: Composite: Renders a green box of size 59x115 starting at (83, 36) then Draws a black circle centered at (428, 92) with radius 79.
; PLAN: r0=83(x), r1=36(y), r2=59(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=428(x), r6=92(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 83
LDI r1, 36
LDI r2, 59
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 92
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
