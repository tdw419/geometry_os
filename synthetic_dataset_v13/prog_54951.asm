; DESCRIPTION: Composite: Renders a purple disk with center (255, 87) and radius 16 then Creates a magenta rectangular region at (69, 112) spanning 104 by 101 pixels.
; PLAN: r0=255(x), r1=87(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=112(y), r7=104(width), r8=101(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 87
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 112
LDI r7, 104
LDI r8, 101
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
