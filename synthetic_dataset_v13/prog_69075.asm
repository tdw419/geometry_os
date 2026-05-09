; DESCRIPTION: Draws a red circle centered at (146, 114) with radius 77.
; PLAN: r0=146(x), r1=114(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 114
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
