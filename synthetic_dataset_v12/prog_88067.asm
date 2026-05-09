; DESCRIPTION: Composite: Draws a yellow circle centered at (168, 139) with radius 74 then Creates a purple rectangular region at (86, 27) spanning 70 by 103 pixels.
; PLAN: r0=168(x), r1=139(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=27(y), r7=70(width), r8=103(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 139
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 27
LDI r7, 70
LDI r8, 103
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
