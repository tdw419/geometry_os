; DESCRIPTION: Composite: Creates a purple rectangular region at (335, 36) spanning 81 by 99 pixels then Draws a yellow circle centered at (130, 152) with radius 51.
; PLAN: r0=335(x), r1=36(y), r2=81(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=152(y), r7=51(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 36
LDI r2, 81
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 152
LDI r7, 51
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
