; DESCRIPTION: Draws a red circle centered at (57, 65) with radius 50.
; PLAN: r0=57(x), r1=65(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 65
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
