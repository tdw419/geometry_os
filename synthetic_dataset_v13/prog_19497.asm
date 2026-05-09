; DESCRIPTION: Draws a red circle centered at (156, 139) with radius 54.
; PLAN: r0=156(x), r1=139(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 139
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
