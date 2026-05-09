; DESCRIPTION: Composite: Places a yellow circle of radius 33 at center (303, 114) then Creates a purple rectangular region at (252, 64) spanning 103 by 83 pixels.
; PLAN: r0=303(x), r1=114(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=64(y), r7=103(width), r8=83(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 114
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 64
LDI r7, 103
LDI r8, 83
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
