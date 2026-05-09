; DESCRIPTION: Draws a red circle centered at (126, 80) with radius 49.
; PLAN: r0=126(x), r1=80(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 80
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
