; DESCRIPTION: Draws a red circle centered at (156, 110) with radius 27.
; PLAN: r0=156(x), r1=110(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 110
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
