; DESCRIPTION: Composite: Places a blue circle of radius 80 at center (313, 144) then Creates a purple rectangular region at (212, 116) spanning 64 by 80 pixels.
; PLAN: r0=313(x), r1=144(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x), r6=116(y), r7=64(width), r8=80(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 144
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 116
LDI r7, 64
LDI r8, 80
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
