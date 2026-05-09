; DESCRIPTION: Composite: Creates a blue rectangular region at (188, 131) spanning 17 by 92 pixels then Creates a magenta circular shape at (305, 120) with radius 40.
; PLAN: r0=188(x), r1=131(y), r2=17(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=305(x), r6=120(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 188
LDI r1, 131
LDI r2, 17
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 120
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
