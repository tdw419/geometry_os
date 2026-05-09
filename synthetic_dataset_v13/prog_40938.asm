; DESCRIPTION: Composite: Places a blue 70x87 rectangle at position (406, 138) then Creates a yellow circular shape at (153, 135) with radius 49.
; PLAN: r0=406(x), r1=138(y), r2=70(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=135(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 138
LDI r2, 70
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 135
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
