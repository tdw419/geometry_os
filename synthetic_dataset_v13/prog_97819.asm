; DESCRIPTION: Composite: Creates a purple rectangular region at (59, 135) spanning 118 by 119 pixels then Renders a green disk with center (450, 58) and radius 33.
; PLAN: r0=59(x), r1=135(y), r2=118(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=450(x), r6=58(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 59
LDI r1, 135
LDI r2, 118
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 58
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
