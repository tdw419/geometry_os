; DESCRIPTION: Draws a red circle centered at (315, 90) with radius 50.
; PLAN: r0=315(x), r1=90(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 90
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
