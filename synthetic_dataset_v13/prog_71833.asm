; DESCRIPTION: Composite: Creates a blue rectangular region at (420, 178) spanning 52 by 11 pixels then Places a green circle of radius 72 at center (383, 172).
; PLAN: r0=420(x), r1=178(y), r2=52(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=172(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 420
LDI r1, 178
LDI r2, 52
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 172
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
