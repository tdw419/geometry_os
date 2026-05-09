; DESCRIPTION: Composite: Places a magenta circle of radius 14 at center (495, 204) then Creates a black rectangular region at (158, 112) spanning 113 by 96 pixels.
; PLAN: r0=495(x), r1=204(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=112(y), r7=113(width), r8=96(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 204
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 112
LDI r7, 113
LDI r8, 96
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
