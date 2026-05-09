; DESCRIPTION: Draws a red circle centered at (146, 39) with radius 30.
; PLAN: r0=146(x), r1=39(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 39
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
