; DESCRIPTION: Draws a red circle centered at (193, 168) with radius 77.
; PLAN: r0=193(x), r1=168(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 168
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
