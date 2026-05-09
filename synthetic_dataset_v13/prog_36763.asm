; DESCRIPTION: Draws a red circle centered at (344, 139) with radius 78.
; PLAN: r0=344(x), r1=139(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 139
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
