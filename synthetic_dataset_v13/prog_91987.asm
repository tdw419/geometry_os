; DESCRIPTION: Composite: Places a magenta circle of radius 76 at center (130, 139) then Creates a magenta rectangular region at (371, 28) spanning 49 by 102 pixels.
; PLAN: r0=130(x), r1=139(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=28(y), r7=49(width), r8=102(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 139
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 28
LDI r7, 49
LDI r8, 102
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
